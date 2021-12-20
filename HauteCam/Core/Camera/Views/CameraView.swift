import SwiftUI

struct CameraView: View {
    @StateObject private var cameraVM = CameraViewModel()
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            cameraVM.cameraPreview.ignoresSafeArea()
                .onAppear {
                    cameraVM.configure()
                }
            
            VStack {
                HStack(spacing: 50) {
                    Button {
                        cameraVM.switchSilent()
                    } label: {
                        Image(systemName: cameraVM.isSilentModeOn ? "speaker.fill" : "speaker")
                            .font(.largeTitle)
                            .foregroundColor(cameraVM.isSilentModeOn ? Color.yellow : Color.white)
                    }
                    
                    Button {
                        cameraVM.switchFlash()
                    } label: {
                        Image(systemName: cameraVM.isFlashOn ? "bolt.fill" : "bolt")
                            .font(.largeTitle)
                            .foregroundColor(cameraVM.isFlashOn ? Color.yellow : Color.white)
                    }
                }
                
                Spacer()
                
                HStack {
                    Button {
                        // 찍은 사진 미리보기
                    } label: {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 5)
                            .frame(width: 80, height: 80)
                    }
                    
                    Spacer()
                    
                    Button {
                        cameraVM.capturePhoto()
                    } label: {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 80, height: 80)
                    }
                    
                    Spacer()
                    
                    Button {
                        cameraVM.changeCamera()
                    } label: {
                        Image(systemName: "arrow.triangle.2.circlepath.camera")
                            .font(.largeTitle)
                    }
                }
                .padding(.horizontal, 20)
            }
            .foregroundColor(.white)
            .padding(.vertical, screen.height / 8)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
