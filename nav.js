document.addEventListener('DOMContentLoaded', function() {
  var root = window.location.pathname.includes('/liacob/') ? '/liacob/' : '/';
  var NAV = '<header class="site-header">'
    + '<div class="header-top">'
    + '  <a href="' + root + 'index.html" class="header-logo">Luciano Iacobelli</a>'
    + '</div>'
    + '<div class="header-bottom">'
    + '<button class="hamburger" id="hamburger"><span></span><span></span><span></span></button>'
    + '<nav class="header-nav" id="header-nav">'
    + '<a href="' + root + 'index.html" class="nav-link">Home</a>'
    + '<div class="nav-dropdown">'
    + '<a href="#" class="nav-link nav-art">Art <svg style="width:1rem; margin-left:0.3rem;" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"></polyline></svg></a>'
    + '<div class="dropdown-panel">'
    + '<a href="' + root + 'art/large.html">Large Artwork</a>'
    + '<a href="' + root + 'art/medium.html">Medium Art</a>'
    + '<a href="' + root + 'art/small.html">Small Art</a>'
    + '<a href="' + root + 'art/digital.html">Digital Art</a>'
    + '<a href="' + root + 'art/assemblage.html">Assemblage</a>'
    + '</div></div>'
    + '<a href="' + root + 'poetry-books/index.html" class="nav-link">Poetry Books</a>'
    + '<a href="' + root + 'lyricalmyrical/index.html" class="nav-link">LyricalMyrical Covers</a>'
    + '<a href="' + root + 'lucs-apartment/index.html" class="nav-link">Luc\'s Apartment</a>'
    + '<a href="' + root + 'contact/index.html" class="nav-link">Contact</a>'
    + '</nav></div></header>';

  var FOOTER = '<footer><div class="footer-inner">'
    + '<div class="footer-contact-block"><h4>Contact</h4>'
    + '<p>For inquiries: <a href="mailto:julianiacobelli1@gmail.com">julianiacobelli1@gmail.com</a></p></div>'
    + '<div class="footer-bottom">&copy; 2026, Luciano Iacobelli</div>'
    + '</div></footer>';

  document.body.insertAdjacentHTML('afterbegin', NAV);
  document.body.insertAdjacentHTML('beforeend', FOOTER);

  document.getElementById('hamburger').addEventListener('click', function() {
    document.getElementById('header-nav').classList.toggle('open');
  });

  var path = window.location.pathname;
  document.querySelectorAll('.nav-link').forEach(function(link) {
    var href = link.getAttribute('href');
    if (href && href !== '#' && path.endsWith(href.replace(/^\//, ''))) {
      link.classList.add('active');
    }
  });
  if (path === '/' || (path.endsWith('index.html') && !path.includes('/art/') && !path.includes('/poetry') && !path.includes('/lyrical') && !path.includes('/lucs') && !path.includes('/contact'))) {
    var homeLink = document.querySelector('a[href="' + root + 'index.html"]');
    if (homeLink) homeLink.classList.add('active');
  }
  if (path.includes('/art/')) {
    var artLink = document.querySelector('.nav-art');
    if (artLink) artLink.classList.add('active');
  }
});
