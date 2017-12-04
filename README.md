# Go Overlay

[![Build Status](https://travis-ci.org/Dr-Terrible/go-overlay.png)](https://travis-ci.org/Dr-Terrible/go-overlay)

The _Go Overlay_ is intended as a Portage collection of [Go](https://golang.org)
related ebuilds — mainly applications and tools written in Go. This
repository offers Go packages that can be compiled in a **reproducible way**,
without the need of recompiling wacky and obscure Go dependencies, or placing
weird Go libraries inside your system GOROOT, and then ending up with a polluted
and screwed up [Go environment](https://golang.org/doc/code.html#Workspaces).

The primary reason why Go packages cannot be reproducibly built is because the
`import statement`(which drives `go get`) does not contain sufficient
information to identify which revision of a Go package it should fetch.
Additionally, if the source code of a Go package changes in an incompatible way,
there is no way for ebuild that consumes that import path to indicate that it
does not want to blindly build against the latest revision of the code. Head
over [there](http://getgb.io) for more information about reproducible builds in
Go.

The _Go Overlay_ main purpose is to create an easy way for the Go community
to use Gentoo. This overlay strives to maintain a large set of Go packages as
well as wide configuration options that users of Gentoo have come to expect.


## User's Guide

### Installing The Overlay

In order to [manage overlays](https://wiki.gentoo.org/wiki/Overlay), the
package [**app-portage/layman**](https://wiki.gentoo.org/wiki/Layman) must be
installed into your Gentoo environment:

```
emerge -av app-portage/layman
```

If the installation of _layman_ was successfully completed, then you are ready
to sync the content of this repository:

```
layman -a go-overlay
```

If you use [eix](https://wiki.gentoo.org/wiki/Eix) you may need to execute:

```
eix-update
```


### Updating The Overlay

Keep the overlay up to date with the following command:

```
layman -s go-overlay
```


### Removing The Overlay

The process of removing this overlay from your Gentoo environment is quite
straightforward:

```
layman -d go-overlay
```


## Contributing

I welcome issue reports, feedbacks, and ebuild requests; I encourage you to use
the [issues list](https://github.com/Dr-Terrible/go-overlay/issues) on GitHub to
provide them.

Code contributions and bug fixes are welcome too, and I encourage the use of
pull requests to _discuss_ and _review_ your ebuild code changes. Before
proposing a large change, please discuss it by raising an issue.

### Before You Begin

This overlay assumes that you have read, and properly understood, the
[Gentoo Developer Manual](https://devmanual.gentoo.org).

### Code of Conduct

Help me to keep this overlay open and inclusive for everyone. Please, read and
follow the [Code of Conduct](CODE_OF_CONDUCT.md).

### Making and Submitting Changes

To make the process of pull requests submission as seamless as possible, I ask
for the following:

1. Go ahead and fork this project and make your changes.
2. When your code changes are ready, make sure to run `repoman fix -d`,
   `repoman full -d`, and `repoman -vx full` in the root of the repository to
   ensure that all the Gentoo's QA tests pass. This is necessary to assure
   nothing was accidentally broken by your changes; for the purpose this GitHub
   repository integrates Travis for Continuous Integration of repoman tests.
   **I only take pull requests with passing repoman tests**.
3. Squash your commits into a single one with `git rebase -i`. It's okay to
   force update your pull request.
4. Make sure your git commit messages are in the proper format to make reading
   history easier. Commit message should look like:

   ```
   [category/package-name] Short description

   Long description
   ```

   If you have questions about how to write the short / long descriptions, please
   read these blog articles: [How to Write a Commit Message](http://chris.beams.io/posts/git-commit),
   [5 Useful Tips For A Better Commit Message](https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message). Both of them are excellent resources for learning how to write a
   well-crafted git commit message. If your commit references one or more GitHub
   issues, always end your commit message body with _See #1234_ or _Fixes #1234_
   (replace 1234 with the desired GitHub issue ID).
5. GPG signing your changes is a good idea, but not mandatory.
6. Push your changes to your branch in your fork, and then submit a
   [pull request](https://help.github.com/send-pull-requests) agains this
   repository.
7. Comment in the pull request when you are ready for the changes to be
   reviewed: `PR ready for review`.

At this point you are waiting for my feedbacks. I look at pull requests within
few days. I may suggest some improvements or alternatives.
