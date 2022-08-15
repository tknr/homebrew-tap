# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class UptoboxDl < Formula
  desc "An Uptobox/Uptostream batch downloader."
  homepage "https://github.com/Aerion/uptobox-dl"
  url "https://github.com/Aerion/uptobox-dl/archive/refs/heads/master.zip"
  version "1.2.0"
  sha256 "765080eb5de87353e48e2c6b7c051d3fe415058efff120fe3532c4fbbc540d6c"
  license "MIT license"

   depends_on "dotnet" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "dotnet","publish","uptobox-dl/uptobox-dl.csproj","-c","Release","-r","linux-x64"
    system "sudo","chmod","-R","a+rwx",buildpath
    bin.install buildpath/"uptobox-dl/bin/Release/*/linux-x64/uptobox-dl"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test uptobox-dl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "false"
    system "#{bin}/uptobox-dl", "--version"
  end
end
