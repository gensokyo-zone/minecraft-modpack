# kagpack

iunno, the VR stuff is particularly complex, for VR

you'll need:


```
-XX:+UseZGC
```

and to set everything to 12GiB

if you're running a non-parenting window manager (most tiling window managers):

```
_JAVA_AWT_WM_NONREPARENTING=1
```

## Usage / Playing

We recommend the use of Prism Launcher above the other MultiMC-compatibles/derivatives (MultiMC, PolyMC, ...), due to comparative internal politics of these projects.

Import the release instance zip with "add instance" in the launcher. Happy gaming, gamer! ^_^

## Contributing

### Installing / obtaining packwiz

#### From any platform that is not Nix-enabled

Refer to the [packwiz documentation on installation](https://packwiz.infra.link/installation/).

#### From a system that has Nix installed or on NixOS

```commandline
# from a system with Nix installed
nix-shell
packwiz

# from a system with Nix installed and the experimental features flakes
# and nix-command allowed via your nix configuration
nix develop
packwiz
```

### Working with packwiz

* [Adding mods](https://packwiz.infra.link/tutorials/creating/adding-mods/)
* [Cheat sheet](https://packwiz.infra.link/tutorials/creating/getting-started/#cheat-sheet)
* Optional mods are managed via the [[option]](https://packwiz.infra.link/reference/pack-format/mod-toml/#option) part of a mod-specific .pw.toml file.
