module.exports = {
  title: 'ALIS OAuth Document',
  description: 'ALIS OAuth Document',
  base: "/oauth2/",
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Term', link: '/term/' }
    ],
    sidebar: [
      '/term/',
      '/oauth-flow/',
      '/authorization-url/',
      '/idtoken-verify/',
      '/scopes/',
      '/refresh-token/'
    ]
  }
}
