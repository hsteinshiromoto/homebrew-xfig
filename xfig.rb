class Xfig < Formula
  desc "Interactive drawing tool for X"
  homepage "https://mcj.sourceforge.io"
  url "https://downloads.sourceforge.net/projects/mcj/xfig-full-3.2.7.tar.xz"
  sha256 "e6fac2f76e34edbd6595069783379775598f3aa5b0a43d7a97353aa314c0482f"

  depends_on "fig2dev"
  depends_on "ghostscript"
  depends_on "jpeg"
  depends_on :x11

  def install
    system "./configure", "--prefix=#{prefix}",
    system "make", "install"
  end

  test do
    assert_match "Xfig #{version}", shell_output("#{bin}/xfig -v 2>&1")
  end
end
