/* build.vapi generated by valac 0.28.0, do not modify. */

namespace com {
	namespace futureprocessing {
		namespace bob {
			namespace build {
				namespace plugin {
					[CCode (cheader_filename = "src/library/vala/com/futureprocessing/bob/plugin/BuildApplicationPlugin.h")]
					public class BuildApplicationPlugin : com.futureprocessing.bob.build.plugin.AbstractBobBuildPlugin {
						public BuildApplicationPlugin ();
						public override void initialize (com.futureprocessing.bob.recipe.plugin.BobBuildPluginRecipe pluginRecipe);
						public void readBuildConfiguration (com.futureprocessing.bob.recipe.plugin.BobBuildPluginRecipe pluginRecipe);
						public override void run (com.futureprocessing.bob.recipe.project.BobBuildProjectRecipe projectRecipe);
					}
				}
			}
		}
	}
}
[CCode (cheader_filename = "src/library/vala/com/futureprocessing/bob/plugin/plugin.h")]
public static void initializePlugin (com.futureprocessing.bob.build.plugin.BobBuildPluginLoader pluginLoader);
[CCode (cheader_filename = "src/library/vala/com/futureprocessing/bob/plugin/plugin.h")]
public static string[] getDependencies ();