const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >=400) {
        navbar.classList.add('navbar-lewagon-js');
        // navbar.classList.remove('navbar-lewagon');
      } else {
        navbar.classList.remove('navbar-lewagon-js');
        // navbar.classList.add('navbar-lewagon');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
