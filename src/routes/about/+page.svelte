<script>
  import { Heading, Img, P, GradientButton } from "flowbite-svelte";
  import { ArrowDownOutline } from "flowbite-svelte-icons";
  import PdfViewer from "svelte-pdf";

  let resume = "jensen-holm-resume.pdf";
</script>

<div class="flex justify-center items-center">
  <div class="pt-20">
    <Img src="school.png" />
  </div>
</div>

<div class="flex justify-center items-center">
  <div>
    <Heading class="text-center mt-10">About Me</Heading>
  </div>
</div>

<div class="flex justify-center items-center">
  <div class="pb-20 m-10">
    <P firstupper class="pt-20 pb-10 text-center max-w-[600px]"
      >My name is Jensen Holm, and I am a senior at Grand Valley State
      University (GVSU) majoring in Computer Science with a minor in Data
      Science. I've had quite the college experience so far as a varsity student
      athlete on the Track and Field & Cross Country teams, founding the Sports
      Analytics Club, and being involved in other clubs as well like the chess
      club. I've changed my major a few times, starting undecided, but
      eventually I found what I enjoy doing with computing and I haven't looked
      back since. I went to high school on the east side of Michigan in
      Chelsea, MI where I ran track and field and cross country. Now, my hobbies
      include cycling, running, and working on programming projects like this
      one.
    </P>
  </div>
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
  <PdfViewer url="jensen-holm-resume.pdf" showButtons={["zoom"]} data={""}/>
</div>
