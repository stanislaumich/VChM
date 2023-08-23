﻿// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'PdfDoc.pas' rev: 28.00 (Windows)

#ifndef PdfdocHPP
#define PdfdocHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <PdfTypes.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Pdfdoc
{
//-- type declarations -------------------------------------------------------
typedef System::StaticArray<System::UnicodeString, 4> Pdfdoc__1;

typedef System::StaticArray<System::UnicodeString, 4> Pdfdoc__2;

typedef System::StaticArray<System::UnicodeString, 13> Pdfdoc__3;

typedef System::StaticArray<System::UnicodeString, 8> Pdfdoc__4;

enum DECLSPEC_DENUM TPdfPageMode : unsigned char { pmUseNone, pmUseOutlines, pmUseThumbs, pmFullScreen };

enum DECLSPEC_DENUM TLineCapStyle : unsigned char { lcButt_End, lcRound_End, lcProjectingSquareEnd };

enum DECLSPEC_DENUM TLineJoinStyle : unsigned char { ljMiterJoin, ljRoundJoin, ljBevelJoin };

enum DECLSPEC_DENUM TTextRenderingMode : unsigned char { trFill, trStroke, trFillThenStroke, trInvisible, trFillClipping, trStrokeClipping, trFillStrokeClipping, trClipping };

enum DECLSPEC_DENUM TPdfAnnotationSubType : unsigned char { asTextNotes, asLink };

enum DECLSPEC_DENUM TPdfDestinationType : unsigned char { dtXYZ, dtFit, dtFitH, dtFitV, dtFitR, dtFitB, dtFitBH, dtFitBV };

enum DECLSPEC_DENUM TPdfPageLayout : unsigned char { plSinglePage, plOneColumn, plTwoColumnLeft, plTwoColumnRight };

enum DECLSPEC_DENUM TPdfViewerPreference : unsigned char { vpHideToolbar, vpHideMenubar, vpHideWindowUI, vpFitWindow, vpCenterWindow };

typedef System::Set<TPdfViewerPreference, TPdfViewerPreference::vpHideToolbar, TPdfViewerPreference::vpCenterWindow> TPdfViewerPreferences;

enum DECLSPEC_DENUM TPdfCompressionMethod : unsigned char { cmNone };

typedef int TPdfColor;

typedef int TXObjectID;

struct DECLSPEC_DRECORD TPDF_STR_TBL
{
public:
	System::UnicodeString KEY;
	System::UnicodeString VAL;
};


struct DECLSPEC_DRECORD TPDF_INT_TBL
{
public:
	System::UnicodeString KEY;
	int VAL;
};


class DELPHICLASS TPdfHeader;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfHeader : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	void __fastcall WriteToStream(System::Classes::TStream* const AStream);
public:
	/* TObject.Create */ inline __fastcall TPdfHeader(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TPdfHeader(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TPdfTrailer;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfTrailer : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Pdftypes::TPdfDictionary* FAttributes;
	int FXrefAddress;
	
protected:
	void __fastcall WriteToStream(System::Classes::TStream* const AStream);
	
public:
	__fastcall TPdfTrailer(Pdftypes::TPdfObjectMgr* AObjectMgr);
	__fastcall virtual ~TPdfTrailer(void);
	__property int XrefAddress = {read=FXrefAddress, write=FXrefAddress, nodefault};
	__property Pdftypes::TPdfDictionary* Attributes = {read=FAttributes};
};

#pragma pack(pop)

class DELPHICLASS TPdfXrefEntry;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfXrefEntry : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	System::UnicodeString FEntryType;
	int FByteOffset;
	int FGenerationNumber;
	Pdftypes::TPdfObject* FValue;
	System::UnicodeString __fastcall GetAsString(void);
	
public:
	__fastcall TPdfXrefEntry(Pdftypes::TPdfObject* AValue);
	__fastcall virtual ~TPdfXrefEntry(void);
	__property System::UnicodeString EntryType = {read=FEntryType, write=FEntryType};
	__property int ByteOffset = {read=FByteOffset, write=FByteOffset, nodefault};
	__property int GenerationNumber = {read=FGenerationNumber, write=FGenerationNumber, nodefault};
	__property System::UnicodeString AsString = {read=GetAsString};
	__property Pdftypes::TPdfObject* Value = {read=FValue};
};

#pragma pack(pop)

class DELPHICLASS TPdfXref;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfXref : public Pdftypes::TPdfObjectMgr
{
	typedef Pdftypes::TPdfObjectMgr inherited;
	
private:
	System::Classes::TList* FXrefEntries;
	TPdfXrefEntry* __fastcall GetItem(int ObjectID);
	int __fastcall GetItemCount(void);
	
protected:
	void __fastcall WriteToStream(System::Classes::TStream* const AStream);
	
public:
	__fastcall TPdfXref(void);
	__fastcall virtual ~TPdfXref(void);
	virtual void __fastcall AddObject(Pdftypes::TPdfObject* AObject);
	virtual Pdftypes::TPdfObject* __fastcall GetObject(int ObjectID);
	__property TPdfXrefEntry* Items[int ObjectID] = {read=GetItem};
	__property int ItemCount = {read=GetItemCount, nodefault};
};

#pragma pack(pop)

class DELPHICLASS TAbstractPReport;
class PASCALIMPLEMENTATION TAbstractPReport : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
public:
	/* TComponent.Create */ inline __fastcall virtual TAbstractPReport(System::Classes::TComponent* AOwner) : System::Classes::TComponent(AOwner) { }
	/* TComponent.Destroy */ inline __fastcall virtual ~TAbstractPReport(void) { }
	
};


class DELPHICLASS TPdfDoc;
class DELPHICLASS TPdfCatalog;
class DELPHICLASS TPdfCanvas;
class DELPHICLASS TPdfInfo;
class DELPHICLASS TPdfOutlineRoot;
class DELPHICLASS TPdfFont;
class DELPHICLASS TPdfDestination;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfDoc : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	TPdfCatalog* FRoot;
	Pdftypes::TPdfDictionary* FCurrentPages;
	TPdfCanvas* FCanvas;
	TPdfHeader* FHeader;
	TPdfTrailer* FTrailer;
	TPdfXref* FXref;
	TPdfInfo* FInfo;
	bool FHasDoc;
	System::Classes::TList* FFontList;
	System::Classes::TList* FObjectList;
	TPdfOutlineRoot* FOutlineRoot;
	Pdftypes::TPdfArray* FXObjectList;
	System::Word FDefaultPageWidth;
	System::Word FDefaultPageHeight;
	TPdfCompressionMethod FCompressionMethod;
	bool FUseOutlines;
	TPdfCanvas* __fastcall GetCanvas(void);
	TPdfInfo* __fastcall GetInfo(void);
	TPdfCatalog* __fastcall GetRoot(void);
	TPdfOutlineRoot* __fastcall GetOutlineRoot(void);
	
protected:
	void __fastcall CreateInfo(void);
	void __fastcall CreateOutlines(void);
	Pdftypes::TPdfDictionary* __fastcall CreateCatalog(void);
	TPdfFont* __fastcall CreateFont(System::UnicodeString FontName);
	Pdftypes::TPdfDictionary* __fastcall CreatePages(Pdftypes::TPdfDictionary* Parent);
	
public:
	void __fastcall RegisterXObject(Pdftypes::TPdfXObject* AObject, System::UnicodeString AName);
	__fastcall TPdfDoc(void);
	__fastcall virtual ~TPdfDoc(void);
	void __fastcall NewDoc(void);
	void __fastcall FreeDoc(void);
	void __fastcall AddPage(void);
	void __fastcall AddXObject(System::UnicodeString AName, Pdftypes::TPdfXObject* AXObject);
	void __fastcall SaveToStream(System::Classes::TStream* AStream);
	void __fastcall SetVirtualMode(void);
	TPdfFont* __fastcall GetFont(System::UnicodeString FontName);
	Pdftypes::TPdfXObject* __fastcall GetXObject(System::UnicodeString AName);
	Pdftypes::TPdfDictionary* __fastcall CreateAnnotation(TPdfAnnotationSubType AType, const Pdftypes::TPdfRect &ARect);
	TPdfDestination* __fastcall CreateDestination(void);
	__property bool HasDoc = {read=FHasDoc, nodefault};
	__property TPdfCanvas* Canvas = {read=GetCanvas};
	__property TPdfInfo* Info = {read=GetInfo};
	__property TPdfCatalog* Root = {read=GetRoot};
	__property TPdfOutlineRoot* OutlineRoot = {read=GetOutlineRoot};
	__property System::Word DefaultPageWidth = {read=FDefaultPageWidth, write=FDefaultPageWidth, nodefault};
	__property System::Word DefaultPageHeight = {read=FDefaultPageHeight, write=FDefaultPageHeight, nodefault};
	__property TPdfCompressionMethod CompressionMethod = {read=FCompressionMethod, write=FCompressionMethod, nodefault};
	__property bool UseOutlines = {read=FUseOutlines, write=FUseOutlines, nodefault};
};

#pragma pack(pop)

class DELPHICLASS TPdfCanvasAttribute;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfCanvasAttribute : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	float FWordSpace;
	float FCharSpace;
	float FFontSize;
	TPdfFont* FFont;
	float FLeading;
	System::Word FHorizontalScaling;
	void __fastcall SetWordSpace(float Value);
	void __fastcall SetCharSpace(float Value);
	void __fastcall SetFontSize(float Value);
	void __fastcall SetHorizontalScaling(System::Word Value);
	void __fastcall SetLeading(float Value);
	
public:
	float __fastcall TextWidth(System::UnicodeString Text);
	int __fastcall MeasureText(System::UnicodeString Text, float Width);
	__property float WordSpace = {read=FWordSpace, write=SetWordSpace};
	__property float CharSpace = {read=FCharSpace, write=SetCharSpace};
	__property System::Word HorizontalScaling = {read=FHorizontalScaling, write=SetHorizontalScaling, nodefault};
	__property float Leading = {read=FLeading, write=SetLeading};
	__property float FontSize = {read=FFontSize, write=SetFontSize};
	__property TPdfFont* Font = {read=FFont, write=FFont};
public:
	/* TObject.Create */ inline __fastcall TPdfCanvasAttribute(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TPdfCanvasAttribute(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfCanvas : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	Pdftypes::TPdfStream* FContents;
	Pdftypes::TPdfDictionary* FPage;
	TPdfDoc* FPdfDoc;
	TPdfCanvasAttribute* FAttr;
	bool FIsVirtual;
	void __fastcall SetPageWidth(int AValue);
	void __fastcall SetPageHeight(int AValue);
	void __fastcall WriteString(System::UnicodeString S);
	TPdfDoc* __fastcall GetDoc(void);
	Pdftypes::TPdfDictionary* __fastcall GetPage(void);
	int __fastcall GetPageWidth(void);
	int __fastcall GetPageHeight(void);
	System::UnicodeString __fastcall GetColorStr(TPdfColor Color);
	
public:
	__fastcall TPdfCanvas(TPdfDoc* APdfDoc);
	__fastcall virtual ~TPdfCanvas(void);
	void __fastcall GSave(void);
	void __fastcall GRestore(void);
	void __fastcall Concat(float a, float b, float c, float d, float e, float f);
	void __fastcall SetFlat(System::Byte flatness);
	void __fastcall SetLineCap(TLineCapStyle linecap);
	void __fastcall SetDash(System::Byte *aarray, const int aarray_High, System::Byte phase);
	void __fastcall SetLineJoin(TLineJoinStyle linejoin);
	void __fastcall SetLineWidth(float linewidth);
	void __fastcall SetMiterLimit(System::Byte miterlimit);
	void __fastcall MoveTo(float x, float y);
	void __fastcall LineTo(float x, float y);
	void __fastcall CurveToC(float x1, float y1, float x2, float y2, float x3, float y3);
	void __fastcall CurveToV(float x2, float y2, float x3, float y3);
	void __fastcall CurveToY(float x1, float y1, float x3, float y3);
	void __fastcall Rectangle(float x, float y, float width, float height);
	void __fastcall Closepath(void);
	void __fastcall NewPath(void);
	void __fastcall Stroke(void);
	void __fastcall ClosePathStroke(void);
	void __fastcall Fill(void);
	void __fastcall Eofill(void);
	void __fastcall FillStroke(void);
	void __fastcall ClosepathFillStroke(void);
	void __fastcall EofillStroke(void);
	void __fastcall ClosepathEofillStroke(void);
	void __fastcall Clip(void);
	void __fastcall Eoclip(void);
	void __fastcall SetCharSpace(float charSpace);
	void __fastcall SetWordSpace(float wordSpace);
	void __fastcall SetHorizontalScaling(System::Word hScaling);
	void __fastcall SetLeading(float leading);
	void __fastcall SetFontAndSize(System::UnicodeString fontname, float size);
	void __fastcall SetTextRenderingMode(TTextRenderingMode mode);
	void __fastcall SetTextRise(System::Word rise);
	void __fastcall BeginText(void);
	void __fastcall EndText(void);
	void __fastcall MoveTextPoint(float tx, float ty);
	void __fastcall SetTextMatrix(System::Word a, System::Word b, System::Word c, System::Word d, System::Word x, System::Word y);
	void __fastcall MoveToNextLine(void);
	void __fastcall ShowText(System::UnicodeString s);
	void __fastcall ShowTextNextLine(System::UnicodeString s);
	void __fastcall ExecuteXObject(System::UnicodeString xObject);
	void __fastcall SetRGBFillColor(TPdfColor Value);
	void __fastcall SetRGBStrokeColor(TPdfColor Value);
	void __fastcall SetPage(Pdftypes::TPdfDictionary* APage);
	void __fastcall SetFont(System::UnicodeString AName, float ASize);
	void __fastcall TextOut(float X, float Y, System::UnicodeString Text);
	void __fastcall TextRect(const Pdftypes::TPdfRect &ARect, System::UnicodeString Text, Pdftypes::TPdfAlignment Alignment, bool Clipping);
	void __fastcall MultilineTextRect(const Pdftypes::TPdfRect &ARect, System::UnicodeString Text, bool WordWrap);
	void __fastcall DrawXObject(float X, float Y, float AWidth, float AHeight, System::UnicodeString AXObjectName);
	void __fastcall DrawXObjectEx(float X, float Y, float AWidth, float AHeight, float ClipX, float ClipY, float ClipWidth, float ClipHeight, System::UnicodeString AXObjectName);
	void __fastcall Ellipse(float x, float y, float width, float height);
	float __fastcall TextWidth(System::UnicodeString Text);
	int __fastcall MeasureText(System::UnicodeString Text, float AWidth);
	System::UnicodeString __fastcall GetNextWord(const System::UnicodeString S, int &Index);
	__property TPdfCanvasAttribute* Attribute = {read=FAttr};
	__property Pdftypes::TPdfStream* Contents = {read=FContents};
	__property Pdftypes::TPdfDictionary* Page = {read=GetPage};
	__property TPdfDoc* Doc = {read=GetDoc};
	__property int PageWidth = {read=GetPageWidth, write=SetPageWidth, nodefault};
	__property int PageHeight = {read=GetPageHeight, write=SetPageHeight, nodefault};
};

#pragma pack(pop)

class DELPHICLASS TPdfDictionaryWrapper;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfDictionaryWrapper : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
private:
	Pdftypes::TPdfDictionary* FData;
	bool __fastcall GetHasData(void);
	
protected:
	virtual void __fastcall SetData(Pdftypes::TPdfDictionary* AData);
	
public:
	__property Pdftypes::TPdfDictionary* Data = {read=FData, write=SetData};
	__property bool HasData = {read=GetHasData, nodefault};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfDictionaryWrapper(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPdfDictionaryWrapper(void) : System::Classes::TPersistent() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfInfo : public TPdfDictionaryWrapper
{
	typedef TPdfDictionaryWrapper inherited;
	
private:
	System::UnicodeString __fastcall GetAuthor(void);
	void __fastcall SetAuthor(System::UnicodeString Value);
	System::TDateTime __fastcall GetCreationDate(void);
	void __fastcall SetCreationDate(System::TDateTime Value);
	System::UnicodeString __fastcall GetCreator(void);
	void __fastcall SetCreator(System::UnicodeString Value);
	System::UnicodeString __fastcall GetKeywords(void);
	void __fastcall SetKeywords(System::UnicodeString Value);
	System::UnicodeString __fastcall GetSubject(void);
	void __fastcall SetSubject(System::UnicodeString Value);
	System::UnicodeString __fastcall GetTitle(void);
	void __fastcall SetTitle(System::UnicodeString Value);
	System::TDateTime __fastcall GetModDate(void);
	void __fastcall SetModDate(System::TDateTime Value);
	
public:
	__property System::UnicodeString Author = {read=GetAuthor, write=SetAuthor};
	__property System::TDateTime CreationDate = {read=GetCreationDate, write=SetCreationDate};
	__property System::UnicodeString Creator = {read=GetCreator, write=SetCreator};
	__property System::UnicodeString Keywords = {read=GetKeywords, write=SetKeywords};
	__property System::TDateTime ModDate = {read=GetModDate, write=SetModDate};
	__property System::UnicodeString Subject = {read=GetSubject, write=SetSubject};
	__property System::UnicodeString Title = {read=GetTitle, write=SetTitle};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfInfo(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPdfInfo(void) : TPdfDictionaryWrapper() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfCatalog : public TPdfDictionaryWrapper
{
	typedef TPdfDictionaryWrapper inherited;
	
private:
	TPdfDestination* FOpenAction;
	void __fastcall SetPageLayout(TPdfPageLayout Value);
	void __fastcall SetPageMode(TPdfPageMode Value);
	void __fastcall SetNonFullScreenPageMode(TPdfPageMode Value);
	void __fastcall SetViewerPreference(TPdfViewerPreferences Value);
	void __fastcall SetPages(Pdftypes::TPdfDictionary* APage);
	TPdfPageLayout __fastcall GetPageLayout(void);
	TPdfPageMode __fastcall GetPageMode(void);
	TPdfPageMode __fastcall GetNonFullScreenPageMode(void);
	TPdfViewerPreferences __fastcall GetViewerPreference(void);
	Pdftypes::TPdfDictionary* __fastcall GetPages(void);
	
protected:
	void __fastcall SaveOpenAction(void);
	
public:
	__property TPdfDestination* OpenAction = {read=FOpenAction, write=FOpenAction};
	__property TPdfPageLayout PageLayout = {read=GetPageLayout, write=SetPageLayout, nodefault};
	__property TPdfPageMode NonFullScreenPageMode = {read=GetNonFullScreenPageMode, write=SetNonFullScreenPageMode, nodefault};
	__property TPdfPageMode PageMode = {read=GetPageMode, write=SetPageMode, nodefault};
	__property TPdfViewerPreferences ViewerPreference = {read=GetViewerPreference, write=SetViewerPreference, nodefault};
	__property Pdftypes::TPdfDictionary* Pages = {read=GetPages, write=SetPages};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfCatalog(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPdfCatalog(void) : TPdfDictionaryWrapper() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfFont : public TPdfDictionaryWrapper
{
	typedef TPdfDictionaryWrapper inherited;
	
private:
	System::UnicodeString FName;
	
protected:
	void __fastcall AddStrElements(Pdftypes::TPdfDictionary* ADic, TPDF_STR_TBL *ATable, const int ATable_High);
	void __fastcall AddIntElements(Pdftypes::TPdfDictionary* ADic, TPDF_INT_TBL *ATable, const int ATable_High);
	
public:
	__fastcall virtual TPdfFont(TPdfXref* AXref, System::UnicodeString AName);
	virtual int __fastcall GetCharWidth(System::UnicodeString AText, int APos);
	__property System::UnicodeString Name = {read=FName};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TPdfFont(void) { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfDestination : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	TPdfDoc* FDoc;
	Pdftypes::TPdfDictionary* FPage;
	TPdfDestinationType FType;
	System::StaticArray<int, 4> FValues;
	float FZoom;
	System::TObject* FReference;
	void __fastcall SetElement(int Index, int Value);
	void __fastcall SetZoom(float Value);
	int __fastcall GetElement(int Index);
	int __fastcall GetPageWidth(void);
	int __fastcall GetPageHeight(void);
	
public:
	__fastcall TPdfDestination(TPdfDoc* APdfDoc);
	__fastcall virtual ~TPdfDestination(void);
	Pdftypes::TPdfArray* __fastcall GetValue(void);
	__property TPdfDestinationType DestinationType = {read=FType, write=FType, nodefault};
	__property TPdfDoc* Doc = {read=FDoc};
	__property int Left = {read=GetElement, write=SetElement, index=0, nodefault};
	__property int Top = {read=GetElement, write=SetElement, index=1, nodefault};
	__property int Right = {read=GetElement, write=SetElement, index=2, nodefault};
	__property int Bottom = {read=GetElement, write=SetElement, index=3, nodefault};
	__property int PageHeight = {read=GetPageHeight, nodefault};
	__property int PageWidth = {read=GetPageWidth, nodefault};
	__property float Zoom = {read=FZoom, write=SetZoom};
	__property System::TObject* Reference = {read=FReference, write=FReference};
};

#pragma pack(pop)

class DELPHICLASS TPdfOutlineEntry;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfOutlineEntry : public TPdfDictionaryWrapper
{
	typedef TPdfDictionaryWrapper inherited;
	
private:
	TPdfOutlineEntry* FParent;
	TPdfOutlineEntry* FNext;
	TPdfOutlineEntry* FPrev;
	TPdfOutlineEntry* FFirst;
	TPdfOutlineEntry* FLast;
	TPdfDestination* FDest;
	TPdfDoc* FDoc;
	System::UnicodeString FTitle;
	bool FOpened;
	int FCount;
	System::TObject* FReference;
	
protected:
	__fastcall virtual TPdfOutlineEntry(TPdfOutlineEntry* AParent);
	virtual void __fastcall Save(void);
	
public:
	__fastcall virtual ~TPdfOutlineEntry(void);
	TPdfOutlineEntry* __fastcall AddChild(void);
	__property TPdfDoc* Doc = {read=FDoc};
	__property TPdfOutlineEntry* Parent = {read=FParent};
	__property TPdfOutlineEntry* Next = {read=FNext};
	__property TPdfOutlineEntry* Prev = {read=FPrev};
	__property TPdfOutlineEntry* First = {read=FFirst};
	__property TPdfOutlineEntry* Last = {read=FLast};
	__property TPdfDestination* Dest = {read=FDest, write=FDest};
	__property System::UnicodeString Title = {read=FTitle, write=FTitle};
	__property bool Opened = {read=FOpened, write=FOpened, nodefault};
	__property System::TObject* Reference = {read=FReference, write=FReference};
public:
	/* TObject.Create */ inline __fastcall TPdfOutlineEntry(void) : TPdfDictionaryWrapper() { }
	
};

#pragma pack(pop)

#pragma pack(push,4)
class PASCALIMPLEMENTATION TPdfOutlineRoot : public TPdfOutlineEntry
{
	typedef TPdfOutlineEntry inherited;
	
protected:
	__fastcall virtual TPdfOutlineRoot(TPdfDoc* ADoc);
	
public:
	virtual void __fastcall Save(void);
protected:
	/* TPdfOutlineEntry.CreateEntry */ inline __fastcall virtual TPdfOutlineRoot(TPdfOutlineEntry* AParent) : TPdfOutlineEntry(AParent) { }
	
public:
	/* TPdfOutlineEntry.Destroy */ inline __fastcall virtual ~TPdfOutlineRoot(void) { }
	
public:
	/* TObject.Create */ inline __fastcall TPdfOutlineRoot(void) : TPdfOutlineEntry() { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
#define POWER_PDF_VERSION_TEXT L"PowerPdf version 0.9"
static const System::Word PDF_PAGE_WIDTH_A4 = System::Word(0x254);
static const System::Word PDF_PAGE_HEIGHT_A4 = System::Word(0x34a);
static const System::Word PDF_DEFAULT_PAGE_WIDTH = System::Word(0x254);
static const System::Word PDF_DEFAULT_PAGE_HEIGHT = System::Word(0x34a);
static const System::Int8 PDF_FONT_FIXED_WIDTH = System::Int8(0x1);
static const System::Int8 PDF_FONT_SERIF = System::Int8(0x2);
static const System::Int8 PDF_FONT_SYMBOLIC = System::Int8(0x4);
static const System::Int8 PDF_FONT_SCRIPT = System::Int8(0x8);
static const System::Int8 PDF_FONT_STD_CHARSET = System::Int8(0x20);
static const System::Int8 PDF_FONT_ITALIC = System::Int8(0x40);
static const int PDF_FONT_ALL_CAP = int(0x10000);
static const int PDF_FONT_SMALL_CAP = int(0x20000);
static const int PDF_FONT_FOURCE_BOLD = int(0x40000);
#define PDF_DEFAULT_FONT L"Arial"
static const System::Int8 PDF_DEFAULT_FONT_SIZE = System::Int8(0xa);
static const System::Int8 PDF_MIN_HORIZONTALSCALING = System::Int8(0xa);
static const System::Word PDF_MAX_HORIZONTALSCALING = System::Word(0x12c);
static const System::Word PDF_MAX_WORDSPACE = System::Word(0x12c);
static const System::Int8 PDF_MIN_CHARSPACE = System::Int8(-30);
static const System::Word PDF_MAX_CHARSPACE = System::Word(0x12c);
static const System::Word PDF_MAX_FONTSIZE = System::Word(0x12c);
static const System::Int8 PDF_MAX_ZOOMSIZE = System::Int8(0xa);
static const System::Word PDF_MAX_LEADING = System::Word(0x12c);
extern DELPHI_PACKAGE Pdfdoc__1 PDF_PAGE_LAYOUT_NAMES;
extern DELPHI_PACKAGE Pdfdoc__2 PDF_PAGE_MODE_NAMES;
extern DELPHI_PACKAGE Pdfdoc__3 PDF_ANNOTATION_TYPE_NAMES;
extern DELPHI_PACKAGE Pdfdoc__4 PDF_DESTINATION_TYPE_NAMES;
}	/* namespace Pdfdoc */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_PDFDOC)
using namespace Pdfdoc;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// PdfdocHPP
