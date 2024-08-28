package com.tang.common.exception.file;

import com.tang.common.exception.base.BaseException;

/**
 * 文件信息异常类
 * 
 * @author tang
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args)
    {
        super("file", code, args, null);
    }

}
