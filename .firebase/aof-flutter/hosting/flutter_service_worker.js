'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
".dart_tool/package_config.json": "6aab87d6dd6963b39a5f47e267e060b9",
".dart_tool/version": "5192df5bda0c0f1627a735d692b2358d",
".dart_tool/package_config_subset": "a605f9cf3edd1115ee85aef52e126cff",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/outputs.json": "a394e52012b82f0d85874a1afcc0602f",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/web_service_worker.stamp": "69fb6abfefdcd0e6b4175799f64643c7",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/dart2js.stamp": "13023b0414b8237df7ed94a9d1708704",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/main.dart.js.deps": "e4a7a504a5e342ffe4836734ab121286",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/dart2js.d": "09071d84fdcb1c12ad248e0a61dd4dc7",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/app.dill": "a47632770716a30b04256627a6c9c372",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/gen_localizations.stamp": "436d2f2faeb7041740ee3f49a985d62a",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/web_resources.d": "92a9bad312b94432a54952eb72f2101c",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/main.dart.js": "bc52e6fe11cf389dea360b2be657adda",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/flutter_assets.d": "961a94fac57e86c4d866bbab046ec053",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/web_entrypoint.stamp": "db7cc00d2f9adedfc3fe04fee65e598a",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/web_release_bundle.stamp": "71e3f3435dd880938339db8957b8a2eb",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/main.dart": "534282b331c1f7ca083a2b2e8af63d59",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/web_static_assets.stamp": "9bddfe8054ff76e7e50acc04e87b068f",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/service_worker.d": "4bf107f82c104619798d9f8a68c85262",
".dart_tool/flutter_build/56e003841df181c051ec2b45d6d823eb/app.dill.deps": "c29fb7c972a30da14c46e39e8614c276",
".dart_tool/dartpad/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
"manifest.json": "34bf1e0669995d2cc9413e19f3fab693",
"analysis_options.yaml": "66d03d7647c8e438164feaf5b922d44a",
"version.json": "844db8906f99bb0b92d76e24d06276d7",
"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"main.dart.js": "88cb9d6f7ee622996b5f1872f4e57c93",
"aof_flutter.iml": "731a1a3080009db8d4572ef3fb1679c3",
"test/widget_test.dart": "816a7d3b16bc8c91d90a8c8e05f566fa",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"pubspec.lock": "5fcc6134f144a6f3f6e0e45af96927f8",
".idea/workspace.xml": "cc5f609be0f96835c87839f62217d14b",
".idea/modules.xml": "02e0a1a59aaf9634a53feb2e49b16e7f",
".idea/libraries/KotlinJavaRuntime.xml": "4b0df607078b06360237b0a81046129d",
".idea/libraries/Dart_SDK.xml": "5ab6f3a2ee852f0367eb3cdb0fa182e5",
".idea/runConfigurations/main_dart.xml": "2b82ac5d547e7256de51268edfd10dc3",
"build/web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"build/web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"build/web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"build/web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"build/web/manifest.json": "34bf1e0669995d2cc9413e19f3fab693",
"build/web/version.json": "844db8906f99bb0b92d76e24d06276d7",
"build/web/main.dart.js": "bc52e6fe11cf389dea360b2be657adda",
"build/web/flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"build/web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"build/web/canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"build/web/canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"build/web/canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"build/web/canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"build/web/canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"build/web/canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"build/web/canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"build/web/index.html": "0141b9746999035f08e53b571088109c",
"/": "a8f9130fe98dabbc5f295a21a38b9895",
"build/web/assets/NOTICES": "7861d1c8d89b2e92d922d4b525d2afe6",
"build/web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"build/web/assets/AssetManifest.bin.json": "69a99f98c8b1fb8111c5fb961769fcd8",
"build/web/assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"build/web/assets/fonts/MaterialIcons-Regular.otf": "65e21b5db78a7c132bbb04776ec9c399",
"build/web/assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"build/web/assets/AssetManifest.bin": "693635b5258fe5f1cda720cf224f158c",
"build/web/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"README.md": "1bc14d297ff053af9c3c474a0b778ea7",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"index.html": "a8f9130fe98dabbc5f295a21a38b9895",
"lib/main.dart": "86b0318255916c11ea138782b971c22e",
"assets/NOTICES": "d8ddbadf6cf10c0f70071727904dfa50",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/AssetManifest.bin.json": "cfc7f51e59b88d2b8a4d9f18f4b4877e",
"assets/AssetManifest.json": "c24cfef2f223180ec2fe30db0a265cac",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/vacilos.json": "2f045754992beca09d4b77eb186cd878",
"assets/AssetManifest.bin": "46c050abbb334fb28b820b8be8e9d849",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"pubspec.yaml": "6f58e20b5e5bc5574a89692b31956eda"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
