/* repository.vapi generated by valac 0.28.0, do not modify. */

namespace bob {
	namespace builder {
		namespace build {
			namespace plugin {
				[CCode (cheader_filename = "src/library/vala/bob/builder/build/plugin/InstallInLocalRepositoryPlugin.h")]
				public class InstallInLocalRepositoryPlugin : bob.builder.build.plugin.AbstractBobBuildPlugin {
					public InstallInLocalRepositoryPlugin ();
					public override void initialize (bob.builder.recipe.plugin.BobBuildPluginRecipe pluginRecipe) throws bob.builder.build.plugin.BobBuildPluginError;
					public override void run (bob.builder.recipe.project.BobBuildProjectRecipe projectRecipe, bob.builder.filesystem.DirectoryObject projectDirectory) throws bob.builder.build.plugin.BobBuildPluginError;
				}
				[CCode (cheader_filename = "src/library/vala/bob/builder/build/plugin/InstallInLocalRepositoryPlugin.h")]
				public class RepositoryProjectDirectoryStructureBuilder {
					public bob.builder.build.plugin.RepositoryProjectDirectoryStructureBuilder directory (bob.builder.filesystem.DirectoryBuilder.DirectoryBuilderDelegate directoryBuilderDelegate);
					public static bob.builder.build.plugin.RepositoryProjectDirectoryStructureBuilder projectDirectory ();
				}
				[CCode (cheader_filename = "src/library/vala/bob/builder/build/plugin/InstallInLocalRepositoryPlugin.h")]
				public class ScanLocalRepositoryPlugin : bob.builder.build.plugin.AbstractBobBuildPlugin {
					public ScanLocalRepositoryPlugin ();
					public override void initialize (bob.builder.recipe.plugin.BobBuildPluginRecipe pluginRecipe) throws bob.builder.build.plugin.BobBuildPluginError;
					public override void run (bob.builder.recipe.project.BobBuildProjectRecipe projectRecipe, bob.builder.filesystem.DirectoryObject projectDirectory) throws bob.builder.build.plugin.BobBuildPluginError;
				}
			}
		}
	}
}
[CCode (cheader_filename = "src/library/vala/bob/builder/build/plugin/plugin.h")]
public static void initializePlugin (bob.builder.build.plugin.BobBuildPluginLoader pluginsLoader);
[CCode (cheader_filename = "src/library/vala/bob/builder/build/plugin/plugin.h")]
public static string[] getDependencies ();
