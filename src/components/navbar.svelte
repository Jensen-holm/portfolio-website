<script>
  import {
    Navbar,
    NavBrand,
    NavLi,
    NavUl,
    NavHamburger,
  } from "flowbite-svelte";
</script>

<div class="relative px-8">
  <Navbar class="px-2 sm:px-4 py-2.5 fixed w-full z-20 top-0 left-0 border-b">
    <NavBrand href="/">
      <a href="https://github.com/Jensen-holm">
        <img
          src="https://avatars.githubusercontent.com/u/96762808?v=4"
          class="mr-3 h-6 sm:h-9"
          alt="Jensen Holm GitHub"
        />
      </a>
      <a href="https://github.com/Jensen-holm">
        <span
          class="self-center whitespace-nowrap text-xl font-semibold dark:text-white"
          >Jensen Holm</span
        >
      </a>
    </NavBrand>
    <NavHamburger />
    <NavUl>
      <NavLi href="/" active={true}>Home</NavLi>
      <NavLi href="/audio_reverse">Audio Reverse</NavLi>
      <NavLi href="/about">About</NavLi>
      <NavLi href="/contact">Contact</NavLi>
    </NavUl>
  </Navbar>
</div>
