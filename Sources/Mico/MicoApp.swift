import SwiftUI

@main
struct MicoApp: App {
    var body: some Scene {
        WindowGroup("Mico") {
            ContentView()
                .frame(minWidth: 980, minHeight: 680)
        }
        .windowResizability(.contentSize)
    }
}

struct ContentView: View {
    @State private var selectedZone = "Center Right"

    private let zones = [
        "Top Left",
        "Top Right",
        "Center Left",
        "Center Right",
        "Bottom Left",
        "Bottom Right"
    ]

    var body: some View {
        NavigationSplitView {
            List(zones, id: \.self, selection: $selectedZone) { zone in
                Label(zone, systemImage: "square.dashed")
                    .tag(zone)
            }
            .navigationTitle("Mico")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    Button {
                        // Zone creation will be implemented in the next milestone.
                    } label: {
                        Label("Add Zone", systemImage: "plus")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        } detail: {
            VStack(spacing: 24) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Workspace")
                            .font(.largeTitle.bold())
                        Text("Configure the interaction zones around your MacBook.")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Button("Calibrate") {
                        // Calibration flow will be implemented later.
                    }
                    .buttonStyle(.bordered)
                }

                DeskCanvas(selectedZone: $selectedZone)

                HStack {
                    Label(selectedZone, systemImage: "scope")
                        .font(.headline)
                    Spacer()
                    Button("Assign Action") {
                        // Action picker will be implemented in the next milestone.
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(28)
        }
    }
}

struct DeskCanvas: View {
    @Binding var selectedZone: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(.quaternary.opacity(0.35))
                .overlay {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(.quaternary, lineWidth: 1)
                }

            VStack(spacing: 18) {
                Text("DESK")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)

                RoundedRectangle(cornerRadius: 16)
                    .fill(.background)
                    .shadow(radius: 10, y: 4)
                    .frame(width: 460, height: 285)
                    .overlay {
                        VStack(spacing: 10) {
                            Image(systemName: "laptopcomputer")
                                .font(.system(size: 48))
                            Text("MacBook")
                                .font(.title2.weight(.semibold))
                            Text("Interactive workspace")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }

                Text("Select a zone to configure it")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 470)
    }
}
