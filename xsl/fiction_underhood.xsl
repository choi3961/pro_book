<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns:fox="http://xmlgraphics.apache.org/fop/extensions">

<xsl:template match = 'simple-page-master'>
	<fo:block xsl:use-attribute-sets= 'simple-page-master' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-body'>
	<fo:block xsl:use-attribute-sets= 'region-body'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-body02'>
	<fo:block xsl:use-attribute-sets= 'region-body02'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-before'>
	<fo:block xsl:use-attribute-sets= 'region-before'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-before02'>
	<fo:block xsl:use-attribute-sets= 'region-before02'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-after'>
	<fo:block xsl:use-attribute-sets= 'region-after'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-after02'>
	<fo:block xsl:use-attribute-sets= 'region-after02'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-start'>
	<fo:block xsl:use-attribute-sets= 'region-start'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-start02'>
	<fo:block xsl:use-attribute-sets= 'region-start02'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-end'>
	<fo:block xsl:use-attribute-sets= 'region-end'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'region-end02'>
	<fo:block xsl:use-attribute-sets= 'region-end02'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-body'>
	<fo:block xsl:use-attribute-sets= 'right-page-body' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-body02'>
	<fo:block xsl:use-attribute-sets= 'right-page-body02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-before'>
	<fo:block xsl:use-attribute-sets= 'right-page-before' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-before02'>
	<fo:block xsl:use-attribute-sets= 'right-page-before02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-after'>
	<fo:block xsl:use-attribute-sets= 'right-page-after' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-after02'>
	<fo:block xsl:use-attribute-sets= 'right-page-after02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-start'>
	<fo:block xsl:use-attribute-sets= 'right-page-start' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-start02'>
	<fo:block xsl:use-attribute-sets= 'right-page-start02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-end'>
	<fo:block xsl:use-attribute-sets= 'right-page-end' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'right-page-end02'>
	<fo:block xsl:use-attribute-sets= 'right-page-end02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-body'>
	<fo:block xsl:use-attribute-sets= 'left-page-body' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-body02'>
	<fo:block xsl:use-attribute-sets= 'left-page-body02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-before'>
	<fo:block xsl:use-attribute-sets= 'left-page-before' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-before02'>
	<fo:block xsl:use-attribute-sets= 'left-page-before02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-after'>
	<fo:block xsl:use-attribute-sets= 'left-page-after' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-after02'>
	<fo:block xsl:use-attribute-sets= 'left-page-after02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-start'>
	<fo:block xsl:use-attribute-sets= 'left-page-start' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-start02'>
	<fo:block xsl:use-attribute-sets= 'left-page-start02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-end'>
	<fo:block xsl:use-attribute-sets= 'left-page-end' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'left-page-end02'>
	<fo:block xsl:use-attribute-sets= 'left-page-end02' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'front'>
	<fo:block xsl:use-attribute-sets= 'front'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'body'>
	<fo:block xsl:use-attribute-sets= 'body'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'item'>
	<fo:block xsl:use-attribute-sets= 'item' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'style'>
	<fo:block>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'contents'>
	<fo:block xsl:use-attribute-sets= 'contents'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'page'>
	<fo:block xsl:use-attribute-sets= 'page' id='{generate-id()}'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'title'>
	<xsl:choose>
		<xsl:when test="../style[text()='chapter']">
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='chapter'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:when>
		<xsl:otherwise>
			<fo:block xsl:use-attribute-sets='title'>
				<fo:marker marker-class-name='happy'>
					<xsl:value-of select = '.'/>
				</fo:marker>
				<xsl:apply-templates/>
			</fo:block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match = 'p'>
	<fo:block xsl:use-attribute-sets= 'p'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'back'>
	<fo:block xsl:use-attribute-sets= 'back'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'toc-ttl'>
	<fo:block xsl:use-attribute-sets= 'toc-ttl'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'toc-itm'>
	<fo:block xsl:use-attribute-sets= 'toc-itm'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'toc-pge'>
	<fo:block xsl:use-attribute-sets= 'toc-pge'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'tit01'>
	<fo:block xsl:use-attribute-sets= 'tit01'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'tit02'>
	<fo:block xsl:use-attribute-sets= 'tit02'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'tit03'>
	<fo:block xsl:use-attribute-sets= 'tit03'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'tit04'>
	<fo:block xsl:use-attribute-sets= 'tit04'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'tit05'>
	<fo:block xsl:use-attribute-sets= 'tit05'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'space01'>
	<fo:block xsl:use-attribute-sets= 'space01'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'space02'>
	<fo:block xsl:use-attribute-sets= 'space02'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'space03'>
	<fo:block xsl:use-attribute-sets= 'space03'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'space04'>
	<fo:block xsl:use-attribute-sets= 'space04'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

<xsl:template match = 'space05'>
	<fo:block xsl:use-attribute-sets= 'space05'>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>

</xsl:stylesheet>