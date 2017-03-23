[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile



export PATH=$PATH:"/Users/drh/NVPACK/android-sdk-macosx/tools"
export ANDROID_HOME="/Users/drh/NVPACK/android-sdk-macosx"

export PATH=$PATH:"/Users/drh/NVPACK/android-sdk-macosx/platform-tools"

export PATH=$PATH:"/Users/drh/NVPACK/android-sdk-macosx/build-tools"

export PATH=$PATH:"/Users/drh/NVPACK/android-sdk-macosx/extras/android/support"

export PATH=$PATH:"/Users/drh/NVPACK/android-ndk-r12b"
export NDK_ROOT="/Users/drh/NVPACK/android-ndk-r12b"
export NDKROOT="/Users/drh/NVPACK/android-ndk-r12b"
export NVPACK_NDK_VERSION="android-ndk-r12b"

export PATH=$PATH:"/Users/drh/NVPACK/apache-ant-1.8.2/bin"
export ANT_HOME="/Users/drh/NVPACK/apache-ant-1.8.2"

export PATH=$PATH:"/Users/drh/NVPACK/gradle-2.9/bin"
export GRADLE_HOME="/Users/drh/NVPACK/gradle-2.9"


export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home"

# Download video from youtube, convert to mp3 (ignoring errors and keeping a list to avoid downloading dupes)
alias youtube-dl-mp3="youtube-dl -i --download-archive ~/youtube-dl-archive.txt -x --audio-format mp3"

export NVPACK_ROOT="/Users/drh/NVPACK"
