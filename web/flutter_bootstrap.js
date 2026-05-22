{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function(engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    
    // Remove the loading screen once the engine is ready
    const loadingIndicator = document.getElementById('loading_indicator');
    if (loadingIndicator) {
      // Fade out transition for premium feel
      loadingIndicator.style.transition = 'opacity 0.3s ease';
      loadingIndicator.style.opacity = '0';
      setTimeout(() => {
        loadingIndicator.remove();
      }, 300);
    }
    
    await appRunner.runApp();
  }
});
