# Documentation


## Next.js

- Folder `pages` is Routes used by Next.js, index.js is the entry point for Web
- Next.js routing is not supported, use `react-navigation` instead.
- Next.js doesn't support static assets like an Expo project - workaround
- Next.js won't load your statically imported images - workaround 
- We need to include polyfill for setImmidiate, because Next.js doesn’t polyfill by default - How to