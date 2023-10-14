<script>
  import {
    Navbar,
    NavBrand,
    NavLi,
    NavUl,
    NavHamburger,
    Heading,
  } from "flowbite-svelte";
  import {
    LinkedinSolid,
    FacebookSolid,
    GithubSolid,
    MailBoxSolid,
    HomeSolid,
  } from "flowbite-svelte-icons";
</script>

<div class="relative px-8">
  <Navbar class="px-2 sm:px-4 py-2.5 fixed w-full z-20 top-0 left-0 border-b">
    <NavBrand href="/">
      <a href="/" class="p-1">
        <HomeSolid />
      </a>
      <a
        class="p-1"
        href="https://www.facebook.com/jensen.holm.1"
        target="_blank"
      >
        <FacebookSolid />
      </a>
      <a class="p-1" href="https://github.com/Jensen-holm" target="_blank">
        <GithubSolid />
      </a>
      <a
        class="p-3"
        href="https://www.linkedin.com/in/jensen-holm-3584981bb/"
        target="_blank"
      >
        <LinkedinSolid />
      </a>
      <a href="mailto:jensen.dev.01@gmail.com" target="_blank">
        <MailBoxSolid />
      </a>
    </NavBrand>
    <NavHamburger />
    <NavUl>
      <NavLi href="/" active={true}>Projects</NavLi>
      <NavLi href="/about">About</NavLi>
      <NavLi href="mailto:jensen.dev.01@gmail.com" target="_blank"
        >Contact</NavLi
      >
    </NavUl>
  </Navbar>
</div>
