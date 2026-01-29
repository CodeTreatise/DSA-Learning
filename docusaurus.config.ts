import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'DSA Mastery',
  tagline: 'Master Data Structures & Algorithms for Technical Interviews',
  favicon: 'img/favicon.ico',

  future: {
    v4: true,
  },

  url: 'https://codetreatise.github.io',
  baseUrl: '/DSA-Learning/',

  organizationName: 'CodeTreatise',
  projectName: 'DSA-Learning',

  onBrokenLinks: 'ignore',
  onBrokenMarkdownLinks: 'ignore',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  // Use standard markdown format (not MDX)
  markdown: {
    format: 'md',
    mermaid: true,
  },
  themes: ['@docusaurus/theme-mermaid'],

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          routeBasePath: '/',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    [
      '@docusaurus/plugin-pwa',
      {
        debug: true,
        offlineModeActivationStrategies: [
          'appInstalled',
          'standalone',
          'queryString',
        ],
        pwaHead: [
          { tagName: 'link', rel: 'icon', href: '/img/icon-192.png' },
          { tagName: 'link', rel: 'manifest', href: '/manifest.json' },
          { tagName: 'meta', name: 'theme-color', content: '#2e8555' },
          { tagName: 'meta', name: 'apple-mobile-web-app-capable', content: 'yes' },
          { tagName: 'meta', name: 'apple-mobile-web-app-status-bar-style', content: '#2e8555' },
          { tagName: 'link', rel: 'apple-touch-icon', href: '/img/icon-192.png' },
          { tagName: 'link', rel: 'icon', sizes: '192x192', href: '/img/icon-192.png' },
          { tagName: 'link', rel: 'icon', sizes: '512x512', href: '/img/icon-512.png' },
        ],
      },
    ],
  ],

  themeConfig: {
    image: 'img/dsa-social-card.jpg',
    colorMode: {
      defaultMode: 'dark',
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: 'DSA Learning',
      logo: {
        alt: 'DSA Logo',
        src: 'img/logo.svg',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'tutorialSidebar',
          position: 'left',
          label: 'Learn',
        },
        {
          href: 'https://github.com/your-username/dsa-mastery',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Topics',
          items: [
            { label: 'Arrays & Strings', to: '/01-Arrays-Strings/01-Arrays-Strings' },
            { label: 'Recursion', to: '/02-Recursion-Backtracking/02-Recursion-Backtracking' },
            { label: 'Trees', to: '/06-Trees/06-Trees' },
            { label: 'Heaps', to: '/08-Heaps-Priority-Queues/08-Heaps-Priority-Queues' },
          ],
        },
        {
          title: 'Resources',
          items: [
            { label: 'LeetCode', href: 'https://leetcode.com' },
            { label: 'NeetCode', href: 'https://neetcode.io' },
          ],
        },
      ],
      copyright: 'DSA Mastery · Built with Docusaurus',
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['python', 'javascript', 'typescript', 'java'],
    },
    tableOfContents: {
      minHeadingLevel: 2,
      maxHeadingLevel: 4,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
