<script>
    import {
        Navbar,
        NavBrand,
        NavLi,
        NavUl,
        NavHamburger,
        Tooltip,
    } from "flowbite-svelte";
    import {
        LinkedinSolid,
        FacebookSolid,
        GithubSolid,
        MailBoxSolid,
        HomeSolid,
        FileCodeSolid,
        NewspaperSolid,
    } from "flowbite-svelte-icons";

    let resume = "jensen-holm-resume.pdf";
</script>

<div class="relative px-8">
    <Navbar class="px-2 sm:px-4 py-2.5 fixed w-full z-20 top-0 left-0 border-b">
        <NavBrand href="/">
            <a href="/"
               class="p-1">
                <HomeSolid/>
            </a>
            <a
                    class="p-1"
                    href="https://www.facebook.com/jensen.holm.1"
                    target="_blank"
            >
                <FacebookSolid/>
                <Tooltip>Facebook</Tooltip>
            </a>
            <a class="p-1"
               href="https://github.com/Jensen-holm"
               target="_blank">
                <GithubSolid/>
                <Tooltip>GitHub</Tooltip>
            </a>
            <a
                    class="p-3"
                    href="https://www.linkedin.com/in/jensen-holm-3584981bb/"
                    target="_blank"
            >
                <LinkedinSolid/>
                <Tooltip>Linkedin</Tooltip>
            </a>
            <a href="https://medium.com/@jensen.dev.01"
               class="p-3"
               target="_blank">

                <NewspaperSolid></NewspaperSolid>
                <Tooltip>Medium</Tooltip>

            </a>
            <a href="mailto:holmj@mail.gvsu.edu"
               target="_blank">
                <MailBoxSolid/>
                <Tooltip>Email</Tooltip>
            </a>
            <a class="p-2"
               href={resume}
               download={resume}
               target="_blank">
                <FileCodeSolid/>
                <Tooltip>Download Resume</Tooltip>
            </a>
        </NavBrand>
        <NavHamburger/>
        <NavUl>
            <NavLi href="/"
                   active={true}>Home
            </NavLi>
            <NavLi href="mailto:holmj@mail.gvsu.edu"
                   target="_blank"
            >Contact
            </NavLi
            >
        </NavUl>
    </Navbar>
</div>
