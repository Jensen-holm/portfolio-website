<script>
  import { Heading } from "flowbite-svelte";
  import Project from "../components/project.svelte";
</script>

<div class="min-h-screen h-screen">
  <div class="pt-10 pb-5">
    <div class="text-center">
      <Heading
        tag="h2"
        class="mb-4"
        customSize="text-4xl font-extrabold  md:text-5xl lg:text-6xl"
        >Project Portfolio</Heading
      >
    </div>
  </div>

  <div class="flex justify-center items-center">
    <div class="grid gap-4 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 p-4">
      <Project
        projectName="Neural Network from scratch"
        projectImgPath="tree-backprop.png"
        buttonText="Try it"
        buttonHref="/neural_network"
        href="/neural_network"
        description="An application of algorithms such as backprop written from scratch."
      />

      <Project
        projectName="G3N Graphics library wrapper & physics engine"
        projectImgPath="g3n-wrapper-screenshot.png"
        buttonText="Source code"
        buttonHref="https://github.com/Jensen-holm/g3n-wrapper"
        href="https://github.com/Jensen-holm/g3n-wrapper"
        description="Wrapper package with built in physics engine for the G3N graphics package in Go."
      />

      <Project
        projectName="Monte Carlo baseball time machine"
        projectImgPath="sim.png"
        buttonText="Try it"
        buttonHref="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
        href="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
        description="Baseball Monte Carlo simulation web-app. Simulate baseball teams from different era's against each other for up to 1,620 games"
      />

      <Project
        projectName="Audio Reverse"
        projectImgPath="reverse.png"
        buttonText="Try it"
        buttonHref="/audio_reverse"
        href="/audio_reverse"
        description="REST API that reverses audio files."
      />

      <Project
        projectName="Clustering from scratch"
        projectImgPath="iris.png"
        buttonText="Try it"
        buttonHref="/clustering"
        href="/clustering"
        description="An application of clustering algorithms from scratch. Test K-means versus K-medoid clustering algorithms."
      />

      <Project
        projectName="My Portfolio Website"
        projectImgPath="svelte-kit-tailwind.jpg"
        buttonText="Source code"
        buttonHref="/webpage"
        href="/webpage"
        description=""
      />
    </div>
  </div>
</div>
