const CACHE='ledger3-v1';
self.addEventListener('install',e=>e.waitUntil(caches.open(CACHE).then(c=>c.addAll(['/','/index.html'])).then(()=>self.skipWaiting())));
self.addEventListener('activate',e=>e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim())));
self.addEventListener('fetch',e=>{if(e.request.method!=='GET'||e.request.url.includes('supabase.co'))return;e.respondWith(caches.match(e.request).then(r=>r||fetch(e.request).then(res=>{const cl=res.clone();caches.open(CACHE).then(c=>c.put(e.request,cl));return res;})));});
