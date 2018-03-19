package io.peggyjo.peggymeter;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

/**
 * Created by vyakunin on 3/18/18.
 */

public class TableRowAdapter extends ArrayAdapter<LogEntry> {
    private SimpleDateFormat mFormat = new SimpleDateFormat("MMM dd, YYYY, HH:mm:ss", Locale.US);
    private int resource;
    private List<LogEntry> entries;
    public static String[] smileys = {"😢", "☹️", "🙂", "😀", "😃"};

    public TableRowAdapter(@NonNull Context context, int resource, @NonNull List<LogEntry> objects) {
        super(context, resource, objects);
        this.resource = resource;
        entries = objects;
    }

    @NonNull
    @Override
    public View getView(int position, View row, @NonNull ViewGroup parent) {
        TextView date, comment, mood;
        LayoutInflater inflater = ((Activity)getContext()).getLayoutInflater();
        row = inflater.inflate(resource, parent, false);

        date = row.findViewById(R.id.ENTRY_DATE);
        mood = row.findViewById(R.id.ENTRY_MOOD);
        comment = row.findViewById(R.id.ENTRY_COMMENT);

        LogEntry entry = entries.get(position);
        date.setText(mFormat.format(entry.getTime()));
        comment.setText(entry.getComment());
        mood.setText(smileys[entry.getMood_level()]);

        return row;
    }
}