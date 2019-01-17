def image_upload(img)
  logger.info "upload now"
  tempfile = img[:tempfile]
  upload = Cloudinary::Uploader.upload(tempfile.path)
  return upload['url']
end