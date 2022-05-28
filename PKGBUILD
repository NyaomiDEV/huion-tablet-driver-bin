# Maintainer: Naomi Calabretta <github.com/NyaomiDEV>
# Huion developers, please consider making an actual release for Arch Linux!
# In the meantime this PKGBUILD will do the job

pkgname=huion-tablet-driver-bin

pkgver=15.0.0.89
_pkgdate=202205241352
pkgrel=1

pkgdesc="Huion Tablet Driver Setting SoftWare"

url="https://www.huion.com/download/"

arch=('x86_64')
depends=('udev')

# Is the tablet driver actually free software? It has LGPL license on its folder, but no sources to be seen anywhere
license=('custom:"Copyright (c) 2022 Huion"')

# just to be aligned with the deb release, but otherwise useless
conflicts=('Huion' 'huiontablet')
provides=('Huion' 'huiontablet')

source=("https://driverdl.huion.com/driver/Linux/HuionTablet_v$pkgver.$_pkgdate.$arch.tar.xz"
        "close.sh"
        "huion-tablet-driver-bin.hook")
sha512sums=("b50f131042e2e11dc710eb18f35fc0ed0ce1ef138b461dc6d04bbb4124f13bfd939dbec8b7b27d96e071ccfddcc525d53a0fae83788ee41bc426e000d2c52fc2"
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
