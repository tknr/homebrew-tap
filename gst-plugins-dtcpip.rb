# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class GstPluginsDtcpip < Formula
  desc "GStreamer element for decrypting DTCP/IP encrypted content"
  homepage "https://github.com/lyrato/gst-plugins-dtcpip"
  url "https://github.com/lyrato/gst-plugins-dtcpip/archive/refs/heads/master.zip"
  version "0.0.1"
  sha256 "50a80989d7fcfde5439c43a714fd93da4b94f730281aeb23a1c45b121ff34ae4"
  license "https://github.com/lyrato/gst-plugins-dtcpip/blob/master/COPYING"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "./autogen.sh"
    system "make"
    system "sudo","make","install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test gst-plugins-dtcpip`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
