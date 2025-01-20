

const models = {
  "models/monoD/zoeDepth/ckpts": [
    "https://github.com/isl-org/ZoeDepth/releases/download/v1.0/ZoeD_M12_K.pt"
    "https://github.com/isl-org/ZoeDepth/releases/download/v1.0/ZoeD_M12_NK.pt"
    "https://github.com/isl-org/MiDaS/releases/download/v3_1/dpt_beit_large_384.pt"
  ]
}



export def main [] {
  if (which wget | is-empty) {
    print "Wget not found, aborting..."
    return
  }

  $models | items {|path,urls|  
    for url in $urls {
      let name = ($url | path basename)
      let dest = ($path | path join $name)

      if ($dest | path type) == symlink {
        continue
      }

      wget -c $url -O $dest
    }
  }

  ignore


}
