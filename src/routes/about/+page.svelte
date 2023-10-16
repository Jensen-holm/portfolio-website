<script>
  import { Heading, Img, GradientButton } from "flowbite-svelte";
  import { ArrowDownOutline } from "flowbite-svelte-icons";
  import Readme from "../../components/general/readme.svelte";

  let resume = "jensen-holm-resume.pdf";
</script>

<div class="flex justify-center items-center">
  <div class="pt-20">
    <Img src="school.png" />
  </div>
</div>

<div class="flex justify-center items-center">
  <Readme
    readmeUrl="https://raw.githubusercontent.com/Jensen-holm/Jensen-holm/main/README.md"
  />
</div>

<div class="flex justify-center items-center">
  <Heading tag="h3" class="text-center">Resume</Heading>
</div>
<div class="flex justify-center items-center pt-10">
  <GradientButton href={resume} download={resume} target="_blank"
    >Download <ArrowDownOutline class="w-3.5 h-3.5 ml-2 text-white" />
  </GradientButton>
</div>

<div class="flex justify-center items-center p-10">
  <div>
    <Img src="jensen-holm-resume.png" class="p-10" />
  </div>
</div>
