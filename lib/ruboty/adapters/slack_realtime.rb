require 'slack/realtime'
require 'pp'
module Ruboty
  module Adapters
    class SlackRealtime < Base
      env :SLACK_TOKEN, "Account's token (See https://api.slack.com/)"
      env :SLACK_TEAM, "Account's team name (e.g. wonderland)"

      def run
        bind
        connect
      end

      def say(message)
        client.say(
            text: message[:code] ? "```\n#{message[:body]}\n```" : message[:body],
            channel: message[:original][:channel]
        )
      end

      private

      def client
        @client ||= ::Slack::Realtime::Client.new(team: team, token: token)
      end

      def token
        ENV["SLACK_TOKEN"]
      end

      def team
        ENV["SLACK_TEAM"]
      end

      def bind
        client.on(:message, &method(:on_message))
      end

      def connect
        client.connect
      end

      # @note Ignores delayed messages when ruboty was logging out
      def on_message(message)
        robot.receive(
            body: message['text'],
            from: message['channel_name'],
            from_name: message['user_name'],
            to: message['channel'],
            channel: message['channel'],
            user: message['user'],
            # TODO: type is chat or groupchat.
            type: 'groupchat'
        )
      end
    end
  end
end