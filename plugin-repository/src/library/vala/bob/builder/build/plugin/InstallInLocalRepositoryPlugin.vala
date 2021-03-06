using bob.builder.build;
using bob.builder.recipe;
using bob.builder.recipe.plugin;
using bob.builder.recipe.project;
using bob.builder.filesystem;
using bob.builder.log;

namespace bob.builder.build.plugin {

    public class InstallInLocalRepositoryPlugin : AbstractBobBuildPlugin {

        const string PLUGIN_NAME = "repository:install";

        const string RECIPE_ENTRY_VERBOSE = "verbose";
        const string RECIPE_ENTRY_OVERWRITE = "overwrite";

        private Logger LOGGER = Logger.getLogger("InstallInLocalRepositoryPlugin");

        private bool verbose = false; 
        private bool overwrite = true;

        private DirectoryObject projectDirectory;
        private DirectoryObject vapiDirectory;
        private DirectoryObject cDirectory;
        private DirectoryObject libDirectory;

        public InstallInLocalRepositoryPlugin() {
            base(PLUGIN_NAME);
        }

        public override void initialize(BobBuildPluginRecipe pluginRecipe) throws BobBuildPluginError {
            verbose = pluginRecipe.jsonConfiguration.getBooleanEntry(RECIPE_ENTRY_VERBOSE, false);
            overwrite = pluginRecipe.jsonConfiguration.getBooleanEntry(RECIPE_ENTRY_OVERWRITE, true);
        }

        public override void run(BobBuildProjectRecipe projectRecipe, DirectoryObject projectDirectory) throws BobBuildPluginError {
            initializeDirectoryStructure(projectRecipe);
            installProjectInRepository(projectRecipe);
        }

        private void initializeDirectoryStructure(BobBuildProjectRecipe projectRecipe) {
            LOGGER.logInfo("Initializing project directory structure in local repository.");

            RepositoryProjectDirectoryStructure
                .write(repository => {
                    repository.directory(projectRecipe.shortName, project => {

                        projectDirectory = project.directory(projectRecipe.version, versionDirectory => {

                            vapiDirectory = versionDirectory.directory(BobDirectories.DIRECTORY_SOURCE_LIBRARY_VAPI_NAME, null);
                            cDirectory = versionDirectory.directory(BobDirectories.DIRECTORY_SOURCE_LIBRARY_C_NAME, null); 
                            libDirectory = versionDirectory.directory(BobDirectories.DIRECTORY_LIB, null); 
                        });

                    });
                });

            LOGGER.logSuccess("Repository project directory structure ready.");
        }

        private void installProjectInRepository(BobBuildProjectRecipe projectRecipe) {
            LOGGER.logInfo("Installing project files in local repository.");

            DirectoryObject workDirectory = new DirectoryObject.fromCurrentLocation();
            
            dumpRecipeFile(projectRecipe);
            copyVapiFile(workDirectory, projectRecipe);
            copyCFile(workDirectory, projectRecipe);
            copyLibFile(workDirectory, projectRecipe);            
        }

        private void dumpRecipeFile(BobBuildProjectRecipe projectRecipe) {
            LOGGER.logInfo("Dumping receipe file to directory: %s.", projectDirectory.getLocation());

            FileObject newRecipeFile = projectDirectory.newFileChild(BobFiles.FILE_PROJECT_RECIPE);

            BobBuildRecipe newRecipe = new BobBuildRecipe();
            newRecipe.project = projectRecipe;
            try {
                newRecipe.writeToFile(newRecipeFile);
            } catch (Error e) {
                LOGGER.logError("An error occurred while dumping recipe into file: %s.", e.message);
            }
        }

        private void copyVapiFile(DirectoryObject workDirectory, BobBuildProjectRecipe projectRecipe) {
            DirectoryObject sourceVapiDirectory = workDirectory.getDirectoryChildAtLocation(BobDirectories.DIRECTORY_SOURCE_LIBRARY_VAPI);
            if (sourceVapiDirectory.exists()) {
                FileObject vapiFile = sourceVapiDirectory.getFileChild(BobFiles.FILE_SOURCE_VAPI_NAME.printf(projectRecipe.shortName, projectRecipe.version));
                if (vapiFile.exists()) {
                    LOGGER.logInfo("Copying VAPI file %s to directory: %s.", vapiFile.getLocation(), vapiDirectory.getLocation());
                    try {
                        vapiFile.copyTo(vapiDirectory, overwrite);
                    } catch (Error e) {
                        LOGGER.logError("An error occurred while copying VAPI file: %s.", e.message);
                    }
                }
            }
        }

        private void copyCFile(DirectoryObject workDirectory, BobBuildProjectRecipe projectRecipe) {
            DirectoryObject sourceCDirectory = workDirectory.getDirectoryChildAtLocation(BobDirectories.DIRECTORY_SOURCE_LIBRARY_C);
            if (sourceCDirectory.exists()) {
                FileObject cFile = sourceCDirectory.getFileChild(BobFiles.FILE_SOURCE_C_HEADER_NAME.printf(projectRecipe.shortName, projectRecipe.version));
                if (cFile.exists()) {
                    LOGGER.logInfo("Copying C header file %s to directory: %s.", cFile.getLocation(), cDirectory.getLocation());
                    try {
                        cFile.copyTo(cDirectory, overwrite);
                    } catch (Error e) {
                        LOGGER.logError("An error occurred while copying C header file: %s.", e.message);
                    }
                }
            }
        }

        private void copyLibFile(DirectoryObject workDirectory, BobBuildProjectRecipe projectRecipe) {
            DirectoryObject? targetLibDirectory = workDirectory.getDirectoryChildAtLocation(BobDirectories.DIRECTORY_TARGET_LIB);
            if (targetLibDirectory.exists()) {
                FileObject libFile = targetLibDirectory.getFileChild(BobFiles.FILE_TARGET_LIBRARY_NAME.printf(projectRecipe.shortName));
                if (libFile.exists()) {
                    LOGGER.logInfo("Copying SO library file %s to directory: %s.", libFile.getLocation(), libDirectory.getLocation());
                    try {
                        libFile.copyTo(libDirectory, overwrite);
                    } catch (Error e) {
                        LOGGER.logError("An error occurred while copying SO library file: %s.", e.message);
                    }
                }
            }
        }
    }
}