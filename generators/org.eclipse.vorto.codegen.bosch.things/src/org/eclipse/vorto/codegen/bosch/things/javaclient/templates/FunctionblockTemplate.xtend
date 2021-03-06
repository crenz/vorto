/*******************************************************************************
 * Copyright (c) 2016 Bosch Software Innovations GmbH and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * and Eclipse Distribution License v1.0 which accompany this distribution.
 *   
 * The Eclipse Public License is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * The Eclipse Distribution License is available at
 * http://www.eclipse.org/org/documents/edl-v10.php.
 *   
 * Contributors:
 * Bosch Software Innovations GmbH - Please refer to git log
 *******************************************************************************/
package org.eclipse.vorto.codegen.bosch.things.javaclient.templates

import org.eclipse.vorto.codegen.api.IFileTemplate
import org.eclipse.vorto.codegen.api.InvocationContext
import org.eclipse.vorto.codegen.bosch.things.javaclient.TypeMapper
import org.eclipse.vorto.core.api.model.functionblock.FunctionblockModel

class FunctionblockTemplate implements IFileTemplate<FunctionblockModel> {

    override getFileName(FunctionblockModel model) {
        return model.getName()+".java"
    }
    
    override getPath(FunctionblockModel model) {
        return "/simulator/src/main/java/com/example/things/functionblocks"
    }
    

    override getContent(FunctionblockModel model,InvocationContext context) {
	    
'''
package com.example.things.functionblocks;

public class «model.getName» {
    «FOR statusProperty : model.functionblock.status.properties»
    private «TypeMapper.mapSimpleDatatype(statusProperty.type)» «TypeMapper.checkKeyword(statusProperty.name)»;
    «ENDFOR»
    
    «FOR statusProperty : model.functionblock.status.properties»
    /**
     * Getter for «statusProperty.name».
     */
    public «TypeMapper.mapSimpleDatatype(statusProperty.type)» get«TypeMapper.checkKeyword(statusProperty.name).toFirstUpper»() {
        return «TypeMapper.checkKeyword(statusProperty.name)»;
    }
    
    /**
     * Setter for «statusProperty.name».
     */
    public void set«TypeMapper.checkKeyword(statusProperty.name).toFirstUpper»(«TypeMapper.mapSimpleDatatype(statusProperty.type)» «TypeMapper.checkKeyword(statusProperty.name)») {
        this.«TypeMapper.checkKeyword(statusProperty.name)» = «TypeMapper.checkKeyword(statusProperty.name)»;
    }

    «ENDFOR»

}
'''
	}

}
