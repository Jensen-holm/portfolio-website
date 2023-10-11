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
        buttonHref="/machine_learning_from_scratch"
        href="/machine_learning_from_scratch"
        description="Test machine learning algorithms I built from scratch with your own data."
      />

      <Project
        projectName="G3N Graphics library wrapper & physics engine"
        projectImgPath="g3n-wrapper.gif"
        buttonText="Source code"
        buttonHref="https://github.com/Jensen-holm/g3n-wrapper"
        href="https://github.com/Jensen-holm/g3n-wrapper"
        description="Wrapper package with built in physics engine for the G3N graphics package in Go."
        inProgress={false}
        newTab={true}
      />

      <Project
        projectName="Monte Carlo baseball time machine"
        projectImgPath="bball_time_machine.gif"
        buttonText="Try it"
        buttonHref="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
        href="https://jensen-holm-mlb-app-app-q1fw6t.streamlit.app/"
        description="Baseball Monte Carlo simulation web-app. Simulate baseball teams from different era's against each other for up to 1,620 games"
        newTab={true}
      />

      <Project
        projectName="My Portfolio Website"
        projectImgPath="svelte-kit-tailwind.jpg"
        buttonText="Source code"
        buttonHref="/webpage"
        href="/webpage"
        description="I built this website using svelte-kit and tailwind css for a simple, lightweight, & responsive application."
        inProgress={true}
      />
    </div>
  </div>
</div>
