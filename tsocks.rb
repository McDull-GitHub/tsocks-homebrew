require 'formula'
 
class Tsocks < Formula
  homepage 'http://github.com/pc/tsocks'
  head 'https://github.com/pc/tsocks.git'
 
  depends_on 'autoconf' => :build if MacOS::Xcode.version.to_f >= 4.3
 
  def install
    system "autoconf", "-v"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--with-conf=#{config_file}"
    inreplace("tsocks") { |bin| bin.change_make_var! "LIBDIR", lib }
    system "make"
    system "make install"
    etc.install "tsocks.conf.simple.example" => "tsocks.conf" unless config_file.exist?
  end
 
  def test
    puts 'Your current ip is:'
    ohai `curl -s ip.sb 2>&1`.chomp
    puts 'Your proxy server ip is:'
    ohai `tsocks curl -s ip.sb 2>&1`.chomp
  end
 
  def config_file
    etc / 'tsocks.conf'
  end
end
