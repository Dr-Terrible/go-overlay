# Golang Overlay

[![Build Status](https://travis-ci.org/Dr-Terrible/go-overlay.png)](https://travis-ci.org/Dr-Terrible/go-overlay)

This overlay offers [Golang](https://golang.org) related ebuilds.


### Installing the overlay

In order to manage the overlay, the package **app-portage/layman** must be installed into your environment:

```
emerge -av app-portage/layman
```

If the installation of _layman_ was successfully completed, then you are ready to sync this repository to your locally installed overlay:

```
layman -a go-overlay
```


### Updating the overlay

Keep the overlay up to date with:

```
layman -s go-overlay
```


### Removing the overlay

The process of removing this overlay from your Gentoo environment is quite straightforward:

```
layman -d go-overlay
```

## Contributing

This overlay is still under development. Feedbacks and pull requests are very welcome and I encourage you to use the [issues list](https://github.com/Dr-Terrible/go-overlay/issues) on GitHub to provide your contributions.

I rarely reject pull requests.