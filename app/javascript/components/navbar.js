const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-green');
      } else {
        navbar.classList.remove('navbar-lewagon-green');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
