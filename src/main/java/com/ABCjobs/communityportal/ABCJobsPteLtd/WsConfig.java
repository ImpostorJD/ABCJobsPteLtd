package com.ABCjobs.communityportal.ABCJobsPteLtd;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;


/**
 * WsConfig --- For web socket implementation
 * @author Joh Daniel Tejero
 *
 */
@Configuration
@EnableWebSocketMessageBroker
public class WsConfig implements WebSocketMessageBrokerConfigurer{

	/**
	 * Configuration of message broker
	 */
	@Override
	 public void configureMessageBroker(MessageBrokerRegistry registry) {
	    registry.enableSimpleBroker("/topic");
	    registry.setApplicationDestinationPrefixes("/app");
	  }
	
	/**
	 * Configuration for endpoint for bidirectional communication
	 */
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/AbcCommunication").setAllowedOriginPatterns("*").withSockJS();
	}
	
}
	
	