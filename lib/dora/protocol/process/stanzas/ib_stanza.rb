module Dora
  module Protocol
    module Process
      module Stanzas
        module IbStanza

          def process_ib(node, *args)
            node.children.each do | child |
              case child.tag
                when 'account', 'offline'
                when 'dirty'
                  send_clear_dirty([child.attributes['type']])
                else
                  raise ChatAPIError.new("ib handler for #{child.tag} not implemented")
              end
            end
          end

        end
      end
    end
  end
end