Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '239852873364657', '5333d71aaf7dbe79be1594d128f755fc'
  end
  
  