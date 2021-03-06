/* plugin-uncrustify-0.0.1.h generated by valac 0.30.0, the Vala compiler, do not modify */


#ifndef __SRC_LIBRARY_C_PLUGIN_UNCRUSTIFY_0_0_1_H__
#define __SRC_LIBRARY_C_PLUGIN_UNCRUSTIFY_0_0_1_H__

#include <glib.h>
#include <bob-0.0.1.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>

G_BEGIN_DECLS


#define BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_PLUGIN (bob_builder_build_plugin_uncrustify_plugin_get_type ())
#define BOB_BUILDER_BUILD_PLUGIN_UNCRUSTIFY_PLUGIN(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_PLUGIN, bobbuilderbuildpluginUncrustifyPlugin))
#define BOB_BUILDER_BUILD_PLUGIN_UNCRUSTIFY_PLUGIN_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_PLUGIN, bobbuilderbuildpluginUncrustifyPluginClass))
#define BOB_BUILDER_BUILD_PLUGIN_IS_UNCRUSTIFY_PLUGIN(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_PLUGIN))
#define BOB_BUILDER_BUILD_PLUGIN_IS_UNCRUSTIFY_PLUGIN_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_PLUGIN))
#define BOB_BUILDER_BUILD_PLUGIN_UNCRUSTIFY_PLUGIN_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_PLUGIN, bobbuilderbuildpluginUncrustifyPluginClass))

typedef struct _bobbuilderbuildpluginUncrustifyPlugin bobbuilderbuildpluginUncrustifyPlugin;
typedef struct _bobbuilderbuildpluginUncrustifyPluginClass bobbuilderbuildpluginUncrustifyPluginClass;
typedef struct _bobbuilderbuildpluginUncrustifyPluginPrivate bobbuilderbuildpluginUncrustifyPluginPrivate;

#define BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_RUNNER (bob_builder_build_plugin_uncrustify_runner_get_type ())
#define BOB_BUILDER_BUILD_PLUGIN_UNCRUSTIFY_RUNNER(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_RUNNER, bobbuilderbuildpluginUncrustifyRunner))
#define BOB_BUILDER_BUILD_PLUGIN_UNCRUSTIFY_RUNNER_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_RUNNER, bobbuilderbuildpluginUncrustifyRunnerClass))
#define BOB_BUILDER_BUILD_PLUGIN_IS_UNCRUSTIFY_RUNNER(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_RUNNER))
#define BOB_BUILDER_BUILD_PLUGIN_IS_UNCRUSTIFY_RUNNER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_RUNNER))
#define BOB_BUILDER_BUILD_PLUGIN_UNCRUSTIFY_RUNNER_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), BOB_BUILDER_BUILD_PLUGIN_TYPE_UNCRUSTIFY_RUNNER, bobbuilderbuildpluginUncrustifyRunnerClass))

typedef struct _bobbuilderbuildpluginUncrustifyRunner bobbuilderbuildpluginUncrustifyRunner;
typedef struct _bobbuilderbuildpluginUncrustifyRunnerClass bobbuilderbuildpluginUncrustifyRunnerClass;
typedef struct _bobbuilderbuildpluginUncrustifyRunnerPrivate bobbuilderbuildpluginUncrustifyRunnerPrivate;

struct _bobbuilderbuildpluginUncrustifyPlugin {
	bobbuilderbuildpluginAbstractBobBuildPlugin parent_instance;
	bobbuilderbuildpluginUncrustifyPluginPrivate * priv;
};

struct _bobbuilderbuildpluginUncrustifyPluginClass {
	bobbuilderbuildpluginAbstractBobBuildPluginClass parent_class;
};

struct _bobbuilderbuildpluginUncrustifyRunner {
	GObject parent_instance;
	bobbuilderbuildpluginUncrustifyRunnerPrivate * priv;
};

struct _bobbuilderbuildpluginUncrustifyRunnerClass {
	GObjectClass parent_class;
};


GType bob_builder_build_plugin_uncrustify_plugin_get_type (void) G_GNUC_CONST;
bobbuilderbuildpluginUncrustifyPlugin* bob_builder_build_plugin_uncrustify_plugin_new (void);
bobbuilderbuildpluginUncrustifyPlugin* bob_builder_build_plugin_uncrustify_plugin_construct (GType object_type);
GType bob_builder_build_plugin_uncrustify_runner_get_type (void) G_GNUC_CONST;
bobbuilderbuildpluginUncrustifyRunner* bob_builder_build_plugin_uncrustify_runner_new (const gchar* configurationFile, gboolean verbose);
bobbuilderbuildpluginUncrustifyRunner* bob_builder_build_plugin_uncrustify_runner_construct (GType object_type, const gchar* configurationFile, gboolean verbose);
void bob_builder_build_plugin_uncrustify_runner_checkUncrustifyAvailable (bobbuilderbuildpluginUncrustifyRunner* self, GError** error);
void bob_builder_build_plugin_uncrustify_runner_run (bobbuilderbuildpluginUncrustifyRunner* self, GList* filesToProcess, const gchar* outputPreffix, gboolean replaceOriginal, GError** error);
gboolean bob_builder_build_plugin_uncrustify_runner_get_backup (bobbuilderbuildpluginUncrustifyRunner* self);
void bob_builder_build_plugin_uncrustify_runner_set_backup (bobbuilderbuildpluginUncrustifyRunner* self, gboolean value);
void initializePlugin (bobbuilderbuildpluginBobBuildPluginLoader* pluginsLoader);
gchar** getDependencies (int* result_length1);


G_END_DECLS

#endif
