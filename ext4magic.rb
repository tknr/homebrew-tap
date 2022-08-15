# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ext4magic < Formula
  desc "Linux admin tool, can help to recover deleted or overwritten files on ext3 and ext4 filesystems"
  homepage "https://sourceforge.net/projects/ext4magic/"
  url "https://github.com/gktrk/ext4magic/archive/refs/heads/master.zip"
  version "0.3.2"
  sha256 "5c6f44b0e6c2fa533eafd3eb82c3ee07889ca05f0e842ec18cb2c720898ec579"
  license "GPL-2.0"

  depends_on "libmagic" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "make"
    system "make","install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ext4magic`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    #system "false"
    system "#{bin}/ext4magic"
  end
end
