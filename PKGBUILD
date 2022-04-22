# Maintainer: Naomi Calabretta <github.com/NyaomiDEV>
# Huion developers, please consider making an actual release for Arch Linux!
# In the meantime this PKGBUILD will do the job

pkgname=huion-tablet-driver-bin

pkgver=15.0.0.80
pkgrel=1

pkgdesc="Huion Tablet Driver Setting SoftWare"

url="https://www.huion.com/download/"

arch=('x86_64')
depends=('udev')

# Is the tablet driver actually free software? It has LGPL license on its folder, but no sources to be seen anywhere
license=('custom:"Copyright (c) 2022 Huion"')

provides=('Huion') # just to be aligned with the deb release, but otherwise useless

source=("https://driverdl.huion.com/driver/Linux/HuionTablet_v15.0.0.80.202204090856.x86_64.tar.xz"
        "close.sh"
        "huion-tablet-driver-bin.hook")
sha512sums=("935c194101242c56d78212acc23648c52a99c211697b61c3942a2acfbbeca9ec965777ce2d8e8e22410abc2a2c0c4dbc2d532a79581f2cd6a550440cabfec17d"
            "a569b3e5bc8f4d0395f72ee9bb5e2aa9ff85ecfd25ce03334103fce766ffdb9234eae03c60cdebe5505aafb1f5a9c91a02712bfd3d4bb7ca982887ff15e8e0c6"
            "a7b2eff37b7a26d9e455b33396107edd502f5352cc7bad23675703a28a035c27456312495ca24807976d4f4fd649233fff3caadee717688ec7cebbe5b7a7125c")

package() {
	# entire app
	mkdir -p "$pkgdir/usr/lib/"
	cp -r "$srcdir/huion/huiontablet" "$pkgdir/usr/lib/"
	chmod 755 -R "$pkgdir/usr/lib/huiontablet"

	# fix some app permissions (huion why not use /run/user/$UID/huiontablet/ for pids and logs?)
	chmod 766 "$pkgdir/usr/lib/huiontablet/DriverUI.pid"
	chmod 766 "$pkgdir/usr/lib/huiontablet/HuionCore.pid"
	chmod 766 "$pkgdir/usr/lib/huiontablet/log.conf"
	chmod 766 "$pkgdir/usr/lib/huiontablet/huion.log"

	# udev rule
	install -Dm644 "$srcdir/huion/huiontablet/res/rule/20-huion.rules" "$pkgdir/usr/lib/udev/rules.d/20-huion.rules"
	
	# application icon
	install -Dm644 "$srcdir/huion/icon/huiontablet.png" "$pkgdir/usr/share/icons/huiontablet.png"
	
	# application launcher
	install -Dm755 "$srcdir/huion/xdg/autostart/huiontablet.desktop" "$pkgdir/usr/share/applications/huiontablet.desktop"
	install -Dm755 "$srcdir/huion/xdg/autostart/huiontablet.desktop" "$pkgdir/etc/xdg/autostart/huiontablet.desktop"
	
	# close script for pacman hook
	install -Dm755 "$srcdir/close.sh" "$pkgdir/usr/lib/huiontablet/close.sh"
	
	# pacman hook
	install -Dm644 "$srcdir/huion-tablet-driver-bin.hook" "$pkgdir/usr/share/libalpm/hooks/huion-tablet-driver-bin.hook"
}
