<script lang="ts">
  import { Card, GradientButton } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";

  export let projectName: string;
  export let projectImgPath: string;
  export let buttonText: string;
  export let description: string;
  export let href: string;
  export let buttonHref: string;
</script>

<Card {href} target="_blank" class="mb-4">
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
  <p class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight">
    {description}
  </p>
  <GradientButton class="w-fit" href={buttonHref} target="_blank">
    {buttonText}<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
  </GradientButton>
</Card>
