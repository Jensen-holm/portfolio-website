<script>
  import {
    Footer,
    FooterCopyright,
    FooterLinkGroup,
    FooterLink,
    FooterBrand,
    FooterIcon,
  } from "flowbite-svelte";
  import {
    FacebookSolid,
    GithubSolid,
    LinkedinSolid,
    DiscordSolid,
  } from "flowbite-svelte-icons";
</script>

<Footer footerType="socialmedia">
  <div class="md:flex md:justify-between">
    <div class="mb-6 md:mb-0">
      <FooterBrand src="gvsu.png" alt="GVSU logo" />
    </div>
    <div class="grid grid-cols-2 gap-8 sm:gap-6 sm:grid-cols-3">
      <div>
        <h2
          class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white"
        >
          Social Media
        </h2>
        <FooterLinkGroup>
          <FooterLink liClass="mb-4" href="https://github.com/Jensen-holm"
            >GitHub</FooterLink
          >
          <FooterLink
            liClass="mb-4"
            href="https://www.linkedin.com/in/jensen-holm-3584981bb/"
            >LinkedIn</FooterLink
          >
        </FooterLinkGroup>
      </div>
      <div>
        <h2
          class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white"
        >
          Contact
        </h2>
        <FooterLinkGroup>
          <FooterLink liClass="mb-4" href="/">Email</FooterLink>
          <FooterLink liClass="mb-4" href="/">Discord</FooterLink>
        </FooterLinkGroup>
      </div>
    </div>
  </div>
  <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
  <div class="sm:flex sm:items-center sm:justify-between">
    <FooterCopyright href="/" by="Jensen Holm" />
    <div class="flex mt-4 space-x-6 sm:justify-center sm:mt-0">
      <FooterIcon href="/">
        <FacebookSolid
          class="w-4 h-4 text-gray-500 dark:text-gray-500 hover:text-gray-900 dark:hover:text-white"
        />
      </FooterIcon>
      <FooterIcon href="https://github.com/Jensen-holm">
        <GithubSolid
          class="w-4 h-4 text-gray-500 dark:text-gray-500 hover:text-gray-900 dark:hover:text-white"
        />
      </FooterIcon>
      <FooterIcon href="/" />
      <FooterIcon href="https://www.linkedin.com/in/jensen-holm-3584981bb/">
        <LinkedinSolid
          class="w-4 h-4 text-gray-500 dark:text-gray-500 hover:text-gray-900 dark:hover:text-white"
        />
      </FooterIcon>
      <FooterIcon href="https://www.linkedin.com/in/jensen-holm-3584981bb/">
        <DiscordSolid
          class="w-4 h-4 text-gray-500 dark:text-gray-500 hover:text-gray-900 dark:hover:text-white"
        />
      </FooterIcon>
    </div>
  </div>
</Footer>
