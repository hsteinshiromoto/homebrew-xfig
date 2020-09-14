class Xfig < Formula
  desc "Interactive drawing tool for X"
  homepage "https://mcj.sourceforge.io"
  url "https://downloads.sourceforge.net/projects/mcj/xfig-3.2.7.tar.xz"

  depends_on "fig2dev"
  depends_on "ghostscript"
  depends_on "jpeg"
#   depends_on "xquartz" # This is a cask
  depends_on :x11

  def install
    system "xmkmf"
    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules"
    system "make", "install"
    system "make", "install-strip"
  end

  test do
    assert_match "Xfig #{version}", shell_output("#{bin}/xfig -v 2>&1")
  end
end
