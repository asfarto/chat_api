require 'dora/protocol/nodes/node'

module Dora
  module Protocol
    module Nodes
      class AckNode < Node

        def initialize(node, cla = nil)
          attributes = {}
          if cla.nil?
            attributes[:url] = node.get_child('media').attributes['url']
          else
            to = node.attributes['to']
            participant = node.attributes['participant']
            type = node.attributes['type']

            attributes[:from] = to unless to.nil?
            attributes[:participant] = participant unless participant.nil?
            attributes[:type] = type unless type.nil?
            attributes[:to] = node.attributes['from']
            attributes[:class] = cla
            attributes[:id] = node.attributes['id']
          end

          super('ack', attributes)
        end
      end
    end
  end
end