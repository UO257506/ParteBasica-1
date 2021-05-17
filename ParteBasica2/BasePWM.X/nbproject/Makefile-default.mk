#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Func.c Main.c C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/LCD_Display.c C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/pasoBanda1.s

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Func.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/_ext/194164451/LCD_Display.o ${OBJECTDIR}/_ext/194164451/pasoBanda1.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Func.o.d ${OBJECTDIR}/Main.o.d ${OBJECTDIR}/_ext/194164451/LCD_Display.o.d ${OBJECTDIR}/_ext/194164451/pasoBanda1.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Func.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/_ext/194164451/LCD_Display.o ${OBJECTDIR}/_ext/194164451/pasoBanda1.o

# Source Files
SOURCEFILES=Func.c Main.c C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/LCD_Display.c C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/pasoBanda1.s


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F6014
MP_LINKER_FILE_OPTION=,--script="C:\Users\evely\Desktop\TRABAJO_DSPIC\ParteBasica-1\ParteBasica2\BasePWM.X\p30F6014.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Func.o: Func.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Func.o.d 
	@${RM} ${OBJECTDIR}/Func.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Func.c  -o ${OBJECTDIR}/Func.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Func.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Func.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Main.c  -o ${OBJECTDIR}/Main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/194164451/LCD_Display.o: C\:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/LCD_Display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/194164451" 
	@${RM} ${OBJECTDIR}/_ext/194164451/LCD_Display.o.d 
	@${RM} ${OBJECTDIR}/_ext/194164451/LCD_Display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/LCD_Display.c  -o ${OBJECTDIR}/_ext/194164451/LCD_Display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/194164451/LCD_Display.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/194164451/LCD_Display.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/Func.o: Func.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Func.o.d 
	@${RM} ${OBJECTDIR}/Func.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Func.c  -o ${OBJECTDIR}/Func.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Func.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Func.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Main.c  -o ${OBJECTDIR}/Main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/194164451/LCD_Display.o: C\:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/LCD_Display.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/194164451" 
	@${RM} ${OBJECTDIR}/_ext/194164451/LCD_Display.o.d 
	@${RM} ${OBJECTDIR}/_ext/194164451/LCD_Display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/LCD_Display.c  -o ${OBJECTDIR}/_ext/194164451/LCD_Display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/194164451/LCD_Display.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/194164451/LCD_Display.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/194164451/pasoBanda1.o: C\:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/pasoBanda1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/194164451" 
	@${RM} ${OBJECTDIR}/_ext/194164451/pasoBanda1.o.d 
	@${RM} ${OBJECTDIR}/_ext/194164451/pasoBanda1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/pasoBanda1.s  -o ${OBJECTDIR}/_ext/194164451/pasoBanda1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/194164451/pasoBanda1.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/194164451/pasoBanda1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/194164451/pasoBanda1.o: C\:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/pasoBanda1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/194164451" 
	@${RM} ${OBJECTDIR}/_ext/194164451/pasoBanda1.o.d 
	@${RM} ${OBJECTDIR}/_ext/194164451/pasoBanda1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/pasoBanda1.s  -o ${OBJECTDIR}/_ext/194164451/pasoBanda1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,-MD,"${OBJECTDIR}/_ext/194164451/pasoBanda1.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/194164451/pasoBanda1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  C:/Program\ Files/Microchip/xc16/v1.61/lib/libdsp-elf.a  C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/p30F6014.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    "C:\Program Files\Microchip\xc16\v1.61\lib\libdsp-elf.a"  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  C:/Program\ Files/Microchip/xc16/v1.61/lib/libdsp-elf.a C:/Users/evely/Desktop/TRABAJO_DSPIC/ParteBasica-1/ParteBasica2/BasePWM.X/p30F6014.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    "C:\Program Files\Microchip\xc16\v1.61\lib\libdsp-elf.a"  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/BasePWM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
