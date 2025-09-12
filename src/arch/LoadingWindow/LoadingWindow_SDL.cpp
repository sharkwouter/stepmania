#include "LoadingWindow_SDL.h"

#include "RageSurface.h"

RString LoadingWindow_SDL::Init() {
  return "SDL";
}

void LoadingWindow_SDL::SetIcon( const RageSurface *pIcon )
{
	// if( m_hIcon != nullptr )
	// 	DestroyIcon( m_hIcon );

	// m_hIcon = IconFromSurface( pIcon );
	// if( m_hIcon != nullptr )
 	// 	SetClassLongPtrA( hwnd, GCLP_HICON, reinterpret_cast<LONG_PTR>(m_hIcon) );
}

void LoadingWindow_SDL::SetSplash( const RageSurface *pSplash )
{
  int32_t BitsPerPixel;
  uint32_t pixel_format = 0;
  switch (pSplash->fmt.BitsPerPixel)
  {
  case 32:
    pixel_format = SDL_PIXELFORMAT_RGBA32;
    break;
  case 24:
    pixel_format = SDL_PIXELFORMAT_RGB24;
    break;
  default:
    pixel_format = SDL_PIXELFORMAT_RGBA32;
    break;
  }
  SDL_Surface * icon = SDL_CreateRGBSurfaceWithFormat(NULL, pSplash->w, pSplash->h, 0, pixel_format);
  icon->pixels = pSplash->pixels;
  SDL_SetWindowIcon(window, icon);
  SDL_FreeSurface(icon);
}

LoadingWindow_SDL::LoadingWindow_SDL()
{
	window = SDL_CreateWindow("Loading Stepmania", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, NULL);
	SDL_assert( window != nullptr );
	// for( unsigned i = 0; i < 3; ++i )
	// 	text[i] = "ABC"; /* always set on first call */
  renderer = SDL_CreateRenderer(window, -1, NULL);
  SDL_assert( renderer != nullptr );

	SetText( "" );
	// Paint();
}

LoadingWindow_SDL::~LoadingWindow_SDL()
{
	SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
}

// void LoadingWindow_SDL::Paint()
// {
// 	SendMessage( hwnd, WM_PAINT, 0, 0 );

// 	/* Process all queued messages since the last paint.  This allows the window to
// 	 * come back if it loses focus during load. */
// 	MSG msg;
// 	while( PeekMessage( &msg, hwnd, 0, 0, PM_NOREMOVE ) )
// 	{
// 		GetMessage(&msg, hwnd, 0, 0 );
// 		DispatchMessage( &msg );
// 	}
// }

void LoadingWindow_SDL::SetText( RString sText )
{
	// vector<RString> asMessageLines;
	// split( sText, "\n", asMessageLines, false );
	// while( asMessageLines.size() < 3 )
	// 	asMessageLines.push_back( "" );

	// const int msgid[] = { IDC_STATIC_MESSAGE1, IDC_STATIC_MESSAGE2, IDC_STATIC_MESSAGE3 };
	// for( unsigned i = 0; i < 3; ++i )
	// {
	// 	if( text[i] == asMessageLines[i] )
	// 		continue;
	// 	text[i] = asMessageLines[i];

	// 	HWND hwndItem = ::GetDlgItem( hwnd, msgid[i] );
	// 	::SetWindowText( hwndItem, ConvertUTF8ToACP(asMessageLines[i]).c_str() );
	// }
}

void LoadingWindow_SDL::SetProgress(const int progress)
{
	// m_progress=progress;
	// HWND hwndItem = ::GetDlgItem( hwnd, IDC_PROGRESS );
	// ::SendMessage(hwndItem,PBM_SETPOS,progress,0);
	// Paint();
}

void LoadingWindow_SDL::SetTotalWork(const int totalWork)
{
	// m_totalWork=totalWork;
	// HWND hwndItem = ::GetDlgItem( hwnd, IDC_PROGRESS );
	// SendMessage(hwndItem,PBM_SETRANGE32,0,totalWork);
}

void LoadingWindow_SDL::SetIndeterminate(bool indeterminate)
{
	// m_indeterminate=indeterminate;

	// HWND hwndItem = ::GetDlgItem( hwnd, IDC_PROGRESS );

	// if(indeterminate) {
	// 	SetWindowLong(hwndItem,GWL_STYLE, PBS_MARQUEE | GetWindowLong(hwndItem,GWL_STYLE));
	// 	SendMessage(hwndItem,PBM_SETMARQUEE,1,0);
	// } else {
	// 	SendMessage(hwndItem,PBM_SETMARQUEE,0,0);
	// 	SetWindowLong(hwndItem,GWL_STYLE, (~PBS_MARQUEE) & GetWindowLong(hwndItem,GWL_STYLE));
	// }
}
