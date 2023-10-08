<script lang="ts">
  import { Card, GradientButton, Badge } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";

  export let projectName: string;
  export let projectImgPath: string;
  export let buttonText: string = "Try it";
  export let description: string = "";
  export let href: string;
  export let buttonHref: string;
  export let inProgress: boolean = false;
  export let newTab: boolean = false;
</script>

<Card {href} target={newTab ? "_blank" : ""} class="mb-4">
  <img
    src={projectImgPath}
    alt="Neural Network from scratch"
    class="w-full h-auto object-contain"
  />
  <h5
    class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
  >
    {projectName}
  </h5>
  {#if inProgress}
    <Badge color="red">In Progress</Badge>
  {:else}
    <Badge color="green">Complete</Badge>
  {/if}
  <p class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight">
    {description}
  </p>
  <GradientButton class="w-fit" href={buttonHref} target="_blank">
    {buttonText}<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
  </GradientButton>
</Card>
