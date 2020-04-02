require "refile/s3"

aws = {
  access_key_id: ENV["ACCESS_KEY_ID"],
  secret_access_key: ENV["SECRET_ACCESS_KEY"],
  region: "sa-east-1",
  bucket: "takeloca2",
  s3_endpoint: "s3-ap-northeast-1.amazonaws.com"
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)