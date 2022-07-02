require "google/apis/youtube_v3"

module GoogleApi
  module Youtube
    class Client
      def initialize
        @app_key = Rails.application.credentials.youtube[:api_key]
      end

      def videos(video_id)
        client = Google::Apis::YoutubeV3::YouTubeService.new
        client.key = @app_key
        parts = %w(id snippet liveStreamingDetails player statistics status)
        client.list_videos(parts.join(","), id: video_id)
      end
    end
  end
end
