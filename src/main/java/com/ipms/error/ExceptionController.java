package com.ipms.error;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanInstantiationException;
import org.springframework.core.convert.ConversionFailedException;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AuthorizationServiceException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import java.sql.SQLException;

@ControllerAdvice
public class ExceptionController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        logger.warn("MethodArgumentNotValidException : ", e.getMessage());
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleMethodArgumentNotValidException(MethodArgumentTypeMismatchException e) {
        logger.warn("MethodArgumentTypeMismatchException : ", e.getMessage());
    }

    @ExceptionHandler(ConversionFailedException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleConversionFailedException(ConversionFailedException e) {
        logger.warn("ConversionFailedException : ", e.getMessage());
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleHttpMessageNotReadableException(HttpMessageNotReadableException e) {
        logger.warn("HttpMessageNotReadableException : ", e.getMessage());
    }

    @ExceptionHandler(NumberFormatException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleNumberFormatException(NumberFormatException e) {
        logger.warn("NumberFormatException : ", e.getMessage());
    }

    @ExceptionHandler(BindException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleBindException(BindException e) {
        logger.warn("BindException : ", e.getMessage());
    }

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleIllegalArgumentException(IllegalArgumentException e) {
        logger.warn("IllegalArgumentException : ", e.getMessage());
    }

    @ExceptionHandler(BeanInstantiationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleBeanInstantiationException(BeanInstantiationException e) {
        logger.warn("BeanInstantiationException : ", e.getMessage());
    }

    @ExceptionHandler(InvalidDataAccessApiUsageException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handleInvalidDataAccessApiUsageException(InvalidDataAccessApiUsageException e) {
        logger.warn("InvalidDataAccessApiUsageException : ", e.getMessage());
    }

    @ExceptionHandler(AuthorizationServiceException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public void handleAuthorizationServiceException(AuthorizationServiceException e) {
        logger.warn("AuthorizationServiceException : ", e.getMessage());
    }

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public void handleNotFoundException(NotFoundException e) {
        logger.warn("NotFoundException : ",e.getMessage());
    }

    @ExceptionHandler(NoSuchMethodException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public void NoSuchMethodException(NotFoundException e) {
        logger.warn("NoSuchMethodException : ",e.getMessage());
    }

    @ExceptionHandler(SQLException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public void SQLException(SQLException e) {
        logger.warn("NoSuchMethodException : ",e.getMessage());
    }


}