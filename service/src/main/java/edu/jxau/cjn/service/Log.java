package edu.jxau.cjn.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public interface Log {

    Logger LOGGER = null;

    default Logger getLogger() {
        if (LOGGER == null){
            return LoggerFactory.getLogger(getClass());
        }
        return LOGGER;
    }

    default void debug(String text, Object... objects) {
        if (getLogger().isDebugEnabled()) {
            getLogger().debug(text, objects);
        }
    }

    default void error(String text, Throwable throwable, Object... objects) {
        if (getLogger().isErrorEnabled()) {
            if (throwable != null){
                getLogger().error("fatal error: " + text + "error info :[{}]", objects, throwable.getMessage());
            }
            getLogger().error("fatal error: " + text, objects);
        }
        if (throwable != null){
            throwable.printStackTrace();
        }
    }

    default void info(String text, Object... objects) {
        if (getLogger().isInfoEnabled()) {
            getLogger().info(text, objects);
        }
    }

    default void warn(String text, Object... objects) {
        if (getLogger().isWarnEnabled()) {
            getLogger().warn(text, objects);
        }
    }

    default void trace(String text, Object... objects) {
        if (getLogger().isTraceEnabled()) {
            getLogger().trace(text, objects);
        }
    }

}
