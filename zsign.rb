# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Zsign < Formula
  desc "Maybe is the most quickly codesign alternative for iOS12+ in the world, cross-platform ( macOS, Linux , Windows ), more features."
  homepage "https://github.com/zhlynn/zsign"
  url "https://github.com/zhlynn/zsign/archive/master.tar.gz"
  head "https://github.com/zhlynn/zsign.git"
  version "master"
  sha256 "880f8d420d4ed7acf958c34895c5a9143ccbdb02219b126d2da33e2a3336d2882"
  license "BSD-3-Clause"

  depends_on "openssl"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    #system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "sudo","bash","-x","INSTALL.sh"
    system "sudo","chmod","-R","a+rwx",buildpath
    bin.install buildpath/"build/zsign"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zsign`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    #system "false"
    system "#{bin}/zsign", "--version"
  end
end
